Return-Path: <linux-leds+bounces-6508-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B348ACEA786
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 19:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24DDE30049EB
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 18:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B330331BC95;
	Tue, 30 Dec 2025 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLyyvw7w"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9724BBFD;
	Tue, 30 Dec 2025 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119329; cv=none; b=phW4aVKleQKJjID/Nad44PxZ2XQUfN0bJ2bAAdMNc+gGFxSAoUihGwIZCLw33ahVwt6ibucIwEvcwTYMe3hoJdyJ1sMuTdBvhq5M4v3QisCHr+uYSTRvM65HrerAfD/whwMnR8biztBgolP+k/gjWkE0+L/JzMMMgdk2qSCKiyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119329; c=relaxed/simple;
	bh=oITgvoy1f9etsxRkSe6R1VHvRNxrloqOlp8F5FJR2+Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UCcj3vRQmr8C8FyjDUsse984WOndqu1vxo9Nklvf/h8X+7OWSwSsvtf+HCttutP13En1OaWF3U168u4gJACgwuoV86Y+61oBDSeWrnw4bUqRasNcLoYm56X2XNrb1bbYppYhbKL21frMc7o7q+Q99frp3ftRKeu+m5KLkQU5JMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLyyvw7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B38C4CEFB;
	Tue, 30 Dec 2025 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767119329;
	bh=oITgvoy1f9etsxRkSe6R1VHvRNxrloqOlp8F5FJR2+Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FLyyvw7wWwr1mGoEw77zSgSrG5IJPzMsgeGBa4T47C8fYNfP52ub9T4IDphzOv/rE
	 v1fnGu0CUA7y5YBGuX0CB3mXc0PSZHBUYR50sGJ/H7I+YohZ4LsvUhR2UYtkCk9u7K
	 UqaNPctMEGVFhQ7Efb+SEwwIFNLZvs2o4uzezwoNjRVAaipkvcZDj2RZHK5vqr6JSL
	 x+YcWtfTNMrUEh73z5nhaA0Q4wfUO1iR3PO9n/RHDO0MILCDkBY29sM86UhIp3fz8H
	 HYCX1MMQTakVUZK/bJBY98r9xqlCY1XuMkLbMAOMpukSPnp2h0PFJCY4KxUL8vd6V2
	 KCRmu/Bkkmmdw==
Date: Tue, 30 Dec 2025 12:28:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Jonathan Brophy <professor_jonny@hotmail.com>, 
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, Pavel Machek <pavel@kernel.org>, 
 Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>
In-Reply-To: <20251228182252.1550173-3-professorjonny98@gmail.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <20251228182252.1550173-3-professorjonny98@gmail.com>
Message-Id: <176711932773.1049013.6093631330842758604.robh@kernel.org>
Subject: Re: [RFC PATCH 2/2] dt-bindings: leds: common: Add led-instance
 property


On Mon, 29 Dec 2025 07:22:45 +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document the optional "led-instance" property for providing deterministic
> LED naming when multiple LEDs share the same function and color.
> 
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../devicetree/bindings/leds/common.yaml      | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/common.yaml: properties:led-instance: 'anyOf' conditional failed, one must be fixed:
	'maxLength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251228182252.1550173-3-professorjonny98@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


