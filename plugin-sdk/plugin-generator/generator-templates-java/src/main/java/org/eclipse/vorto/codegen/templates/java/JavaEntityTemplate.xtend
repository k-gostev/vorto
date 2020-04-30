/**
 * Copyright (c) 2020 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * https://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 */
package org.eclipse.vorto.codegen.templates.java

import org.eclipse.vorto.codegen.api.ITemplate
import org.eclipse.vorto.core.api.model.datatype.Entity
import org.eclipse.vorto.core.api.model.datatype.Property
import org.eclipse.vorto.codegen.api.InvocationContext

/**
 * Use Plugin SDK API instead!
 */
@Deprecated
class JavaEntityTemplate implements ITemplate<Entity>{
	
	var String classPackage;
	var ITemplate<Property> fieldTemplate
	var ITemplate<Property> getterTemplate
	var ITemplate<Property> setterTemplate
	
	new(String classPackage, 
		ITemplate<Property> fieldTemplate, 
		ITemplate<Property> getterTemplate, 
		ITemplate<Property> setterTemplate) {
			this.classPackage=classPackage;
			this.fieldTemplate = fieldTemplate;
			this.getterTemplate = getterTemplate;
			this.setterTemplate = setterTemplate;
	}
	
	override getContent(Entity entity,InvocationContext invocationContext) {
		'''
			/*
			*****************************************************************************************
			* The present code has been generated by the Eclipse Vorto Code Generator.
			*
			* The basis for the generation was the Entity which is uniquely identified by:
			* Name:			«entity.name»
			* Namespace:	«entity.namespace»
			* Version:		«entity.version»
			*****************************************************************************************
			*/
			
			package «classPackage»;
			
			/**
			* «entity.description»
			*/
			«IF entity.superType !== null»
				public class «entity.name.toFirstUpper» extends «entity.superType.name.toFirstUpper» {
			«ELSE»
				public class «entity.name.toFirstUpper» {
			«ENDIF»
			
				«FOR property : entity.properties»
					«fieldTemplate.getContent(property,invocationContext)»
					
				«ENDFOR»
				«FOR property : entity.properties»
					«getterTemplate.getContent(property,invocationContext)»
					
					«setterTemplate.getContent(property,invocationContext)»
					
				«ENDFOR»
			}
		'''
	}
}