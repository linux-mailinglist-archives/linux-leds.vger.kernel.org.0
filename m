Return-Path: <linux-leds+bounces-7002-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEL4KtAjnGkCAAQAu9opvQ
	(envelope-from <linux-leds+bounces-7002-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 10:54:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 294DA1744A3
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 10:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AAB73007671
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 09:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8C834E74E;
	Mon, 23 Feb 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwf0SgQA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927D345CC9;
	Mon, 23 Feb 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840462; cv=none; b=utiS55h9O2C+K0Xd1VVaMTEmEEm+3d4N2Inuw1HbgZYDnfn8PrS2tzz8MznFYhkTMdeA0A5gAtXsr7S5EXCUjvfF1cOTV8oqhWbcFPz14TZxfw8LpHDxogc5Q4GAk4OvCYPb3qDhGF/2YSrP9HSvzcAlzBHmbN+zykyB9h3g3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840462; c=relaxed/simple;
	bh=MVXRdsm93f1hB7K1l0DxGqnQP8MUr8iXty8AQK/vRuY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=soTMPf823xAZLdXU8OIuWYj9mONV6HHhaxM5aRhAOXpnbthwedqPVpJMVd+53veGH/7BWHVuX0WEZYpRCVq9xchDQ+DWsLhuQxb2zQoqf4dIU2r0bZ/QheLCaSHEEBYefOVE1Pd1NkthCiCRLmHjtntrzj1yY6EIMcnULLbmMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwf0SgQA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF78C116C6;
	Mon, 23 Feb 2026 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771840461;
	bh=MVXRdsm93f1hB7K1l0DxGqnQP8MUr8iXty8AQK/vRuY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Gwf0SgQApk8tKBmVZQcUVdE6t3vkKUqAcphNeC0drXimMfSdQ6isNPX00GjFqaQk+
	 l6riyPcVTwKCXV6HU9NS4HxlmA3EUIgnwP9Ja3bhjrrH/Qr0jgwjcjqPj3DfEoK5uW
	 +HTYfj2B7FUCYRQk7Kpqkpt0vDKR9PYAYNb7iadZAC8bsqta32mxqN31MZoPvDnBX7
	 W5s3MuJPoGi2uCJHm06XJNtKpgWEbEHTkXP/mpB98952f5yeWUtChKAx+h3uSokUaD
	 1BL/yK8aMgyObruTtoPCNtqN5nbfey6wFowKjNW8D6LgW7yd/tmR07X3xigX64w8Hx
	 xffPDEA+4gcTw==
Date: Mon, 23 Feb 2026 03:54:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 Pavel Machek <pavel@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260223063858.12208-2-clamor95@gmail.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
 <20260223063858.12208-2-clamor95@gmail.com>
Message-Id: <177184045869.2675234.2886342180628288459.robh@kernel.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: regulator: cpcap-regulator:
 convert to DT schema
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7002-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,baylibre.com,gmail.com,atomide.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 294DA1744A3
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 08:38:50 +0200, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
> from TXT to YAML format. Main functionality preserved.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/regulator/cpcap-regulator.txt    | 35 --------------
>  .../regulator/motorola,cpcap-regulator.yaml   | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml

See https://patchwork.kernel.org/project/devicetree/patch/20260223063858.12208-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


