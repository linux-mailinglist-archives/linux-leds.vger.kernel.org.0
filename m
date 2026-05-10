Return-Path: <linux-leds+bounces-8074-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFViKPF/AGo2JgEAu9opvQ
	(envelope-from <linux-leds+bounces-8074-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 14:54:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1E504325
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 14:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4321D3095551
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 12:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D4B38B12B;
	Sun, 10 May 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM4Wx9lt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919F38AC9C;
	Sun, 10 May 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778417050; cv=none; b=O9j1EK0KZ6jTC3kyj7KDPCgkb8FumKDoMKK8qDARuOQnNqfG4b+ou76oroBQbvDvtl/tW+LWfmEAGhYfUREAGAG6l8LDngY+n3jHhYrID9TeRvT8pd3BuOROAJvsZE4YTmWLvMCDr/KsFzrZfmNOPH1baHoLCULYx0c0/03jT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778417050; c=relaxed/simple;
	bh=XkYjtqEh0x+qK52nljp6z/uh2YBu0HkoogSh7JLdHhA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ND+Iro7vaNmJgxfE//YXFj0q5GeAmPCEyBvGxNoertKfZWGYI9IUMu1q+ICB8zCty0W5HSBg5bcjdImTD7q7Cymb1qkMYfjoOCk5+0dnNQETkIjQ9LQn0B8qpzkRZxXGvEPtomrfWNUnXai51pM+YDoYztThK8u9+yKA7rJXcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM4Wx9lt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A082FC2BCFC;
	Sun, 10 May 2026 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778417049;
	bh=XkYjtqEh0x+qK52nljp6z/uh2YBu0HkoogSh7JLdHhA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZM4Wx9ltXjHetKNHgYmbKtVGDYpzJMfgMaMAgulQbTNCk31hyKQ4s/chANuHttg37
	 bn7UE3CQYqU3wXwUigO5++P5BD+RLmY61ZL0eaY2PMUxWbzHcp9sv0ROAmvxuEu2Sb
	 Es0uPSw9MITwC8Nv4CcIZI6XqeVyeM3OVOwAkpe13/5hahCJmvuSxtMaxxAp732zs3
	 iAv4UNqzFbyura10sQ3Soe/Lv+vTClL+/jEH6NExurmPvEmbyFJpYu6ec3EjG4PSPf
	 Lgo9E1m77xjyQee8DEIieUYCq2MTS5c5FjwXCzTNOlOdPbaqCyTWCseM5iMftAXs6y
	 R4NuZqxW2gshg==
Date: Sun, 10 May 2026 07:44:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
 Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Pavel Machek <pavel@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260510110804.33045-3-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
 <20260510110804.33045-3-clamor95@gmail.com>
Message-Id: <177841704588.2552439.17208885457870143080.robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: input: cpcap-pwrbutton: convert to
 DT schema
X-Rspamd-Queue-Id: 5CA1E504325
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-8074-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,atomide.com,kernel.org,baylibre.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sun, 10 May 2026 14:08:00 +0300, Svyatoslav Ryhel wrote:
> Convert power button devicetree bindings for the Motorola CPCAP MFD from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
>  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
>  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260510110804.33045-3-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


