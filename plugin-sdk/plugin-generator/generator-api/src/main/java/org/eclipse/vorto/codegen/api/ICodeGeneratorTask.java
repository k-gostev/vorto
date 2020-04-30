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
package org.eclipse.vorto.codegen.api;

import org.eclipse.vorto.codegen.api.InvocationContext;

/**
 * Please use the Plugin SDK API instead
 */
@Deprecated
public interface ICodeGeneratorTask<InformationModelFragment> {

  /**
   * Generates code from the specified context and sends it to the specified outputter
   */
  void generate(InformationModelFragment element, InvocationContext context,
      IGeneratedWriter writer);
}
