Return-Path: <linux-leds+bounces-4895-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A21AEB2F2
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 11:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24164A28A1
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 09:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A39293C6E;
	Fri, 27 Jun 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrClMbDZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3C9293B55;
	Fri, 27 Jun 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016672; cv=none; b=B70aMhu4Q6UldC8Bss2nWA7w0gml0jjtnSjrSPAp5aZJer4FMRk01+2GqMpe92sN0wC7fuLQu9MAouuNXUmCKJnW2Vl/WVUQDNtaUXZoI0pMgXTGZ+tJb50xm26DrJbfc5WT/kwXTSnglb0S9KUrjVZVftg4NkHXHaFd83Ydl+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016672; c=relaxed/simple;
	bh=r+cMuNgB6MPRUwQ4haejjrte5YkesaM6//0oKaMCXtk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ANs3mw3tLQ+MNGFTGHHh1AVBzwjMm6jDe9nqyIFFlA2uEcxUPTdaaBL9YGMjfZKOEeNMsjwUdEKrFH+xooHl9SV2dkb9JXKcQVx5iU8vYJItubyywL/srg+/slCZ7efwugoKZphnkNJX9o35+r1lCecV4n9LBiR/iEgGcAbfOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrClMbDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D37C4CEE3;
	Fri, 27 Jun 2025 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016672;
	bh=r+cMuNgB6MPRUwQ4haejjrte5YkesaM6//0oKaMCXtk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GrClMbDZTNQa2dxZzyHT23wfQZ+Hq5XA13kLv4KS8KBYx7TTbUDfI8C6vq3Oxm0XF
	 8AJO0QYWYhMZKpOV+kULgKgUXiUoEeL+j7szQna4QkManv7XrVS0TQ8FkwJMr+GYFu
	 DcO0X9OScLdS2NdTMXQUszJLmjcesqmP32f4ZBF+EKF0wOvRGKpkhdKlr6ddqKsOyn
	 h4XIOC+OuhWqDmexSEZm1+Ci/oDpu+WYu6TN60C741Q8ytqqquOH71FnIw8ymTmQAL
	 GC61zMQnZTnqSwHC9fMawPllsApHQWI6nFKqGokAm3k183VcW4/7h8/Cap7fELVmzw
	 uPuzd4b05ckDQ==
Date: Fri, 27 Jun 2025 04:31:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, Li Jun <jun.li@nxp.com>, 
 imx@lists.linux.dev, Lee Jones <lee@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
 <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
Message-Id: <175101667037.2392362.10689943517425489653.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema


On Fri, 27 Jun 2025 10:01:51 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: audio-gain-db: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


