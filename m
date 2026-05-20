Return-Path: <linux-leds+bounces-8261-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFGmNGo6Dmqu8wUAu9opvQ
	(envelope-from <linux-leds+bounces-8261-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 00:49:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CD59C4EB
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 00:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B7EF30CCA8B
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934CC3624BC;
	Wed, 20 May 2026 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8gqUlyw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6683612F6;
	Wed, 20 May 2026 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308021; cv=none; b=oM5za1ZlTA461miqvRRF/+ICIxwYEPWVpqjLnsKDFDaL7/H9oqGAhPnsedelMh1IlTD+zfS7cJPsQRJAAmUT347XUge742Pt8KFm7vhH5UxxzThvYnjqulfdj2AP8WR/7mbFSKBv8R1wFaZX2SSnbfXO1RjCt6hPnseqZOw9hcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308021; c=relaxed/simple;
	bh=euEms7TYqrmZeVjCBuiSh+bd9lVKE84VjjxrkAif1Ho=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B2aZaNyZI75p7mojWe9CtFUe9mhbshE04X5OJhOkk8EOmacxe7h5F+HlvTeXn50DTdiBJ1gle5ucXYCnIXZ+WPE2q77OcWTPvdPVoVt4DfO0kEH6kkk66duajNPUM4wWCXsS7OJYXp5gufNSEwNeCS04mkHXIUByzCILzfSa7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8gqUlyw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B21A1F00A39;
	Wed, 20 May 2026 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308020;
	bh=Tsdb10MCYeVuX9T+8C6WQO30wsviGsRuozwkSNDJ4+0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=b8gqUlywO68AJVjSw6858va6PLMLoLRNok5oYtr2P3jDUX7fZdS9kLk+YHJ3NoM9C
	 ZTPnveb5ii2sQq4F4InWqZxJVSkNsDBPTuqy3shqaNLlDR6ZSRIrt+F4Oi0mWbhYBx
	 ohDSxjNHAG3K4Vioc+Z5uUj503qOK0KbRjD5a8FdIC8u/6JXZyn+V0QepoqHkYackZ
	 fdAcd8B+H7ckm6P7I3JkElwRnr71yKYsbA4MOeeqlVLgGlum6KzkAumEVz7MxxI+5a
	 XM/+SO2X5B/ipkw0CXNEjuVjZ54v2w+nO+poH/UyXA6bv5lJmxXkXbWU5G5bRaptye
	 Jxdxp/5os3PBA==
Date: Wed, 20 May 2026 15:13:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260520182124.117863-3-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
 <20260520182124.117863-3-clamor95@gmail.com>
Message-Id: <177930801875.740485.17278647053731389937.robh@kernel.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: input: cpcap-pwrbutton: convert to
 DT schema
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8261-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 424CD59C4EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 21:21:20 +0300, Svyatoslav Ryhel wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260520182124.117863-3-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


