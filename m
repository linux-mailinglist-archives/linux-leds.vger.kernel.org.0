Return-Path: <linux-leds+bounces-4490-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F49A8B4C7
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 11:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A1716FC32
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C30723536E;
	Wed, 16 Apr 2025 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b="NQKyrjpe"
X-Original-To: linux-leds@vger.kernel.org
Received: from www253.your-server.de (www253.your-server.de [188.40.28.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7A235348;
	Wed, 16 Apr 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.28.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794504; cv=none; b=VRbBgrk0JQWNaZtlLVgfQxRiPsS37mcnPh9dUMcdyZuf7j+E6KsF06iR0+CsNIIQKXEN8DzNYwpM+fTPc12ixkF7BcRuWjpXS8AjD1M1VVy8WCdSQNlIprHCmN4iQRnJwEeTeEVrF1KmIWxrAyof7VlmQtrIfckI7HxcOoV2YBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794504; c=relaxed/simple;
	bh=HXMLEoovoVHfg+3q0SXDlB/FwPWWpv0sgWUoa044pWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=E/jAGSh6WIhjljTFWpPCJr59Vgc2K4GtJpYrDvNvJPyJXiJjTT1711COnjq7GpFSqsEgwIwecQiFms4Hjd+tICFvQOi4z4WOvQgW56GbMATgRaEsydCYtjcNqC84e5LsaapXzNg+W3ffl3R9RhVcrrDkhweeqkGU8UnQsNymyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de; spf=fail smtp.mailfrom=helmholz.de; dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b=NQKyrjpe; arc=none smtp.client-ip=188.40.28.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=helmholz.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helmholz.de
	; s=default2501; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rCHUjmrRUOceebLsCrTY9ucfwfCCE8djVEiN/Nk9yOs=; b=NQKyrjpe8syY18rDRglOlbbe7z
	I+3DuCHub7H4kihyqPMGSZ5IW5dp+RTaYtnjSTSgBOBurenw7KEciHFx2sY1gl/op6UWnDD9d9RtO
	aqDpHgXj8EaRFWgpshrFb6jx3/EXkMqPyLSP3Z56wTWCNjb0crvVxZsE3CkfwMykd5bcPU1g1rkWQ
	7aPusFRbApgYJOcylXK7u77QUCS9juRE/pH95bnZBq+Dn8xZxVpHHCekmcIAMpyOluGU25VFGrZpD
	coh8je/Rh8/NfTqmjMCiBvt6mi9Nz/e8BJ/gxBN74ggZiFgFCOpP6tFnmkAF3FgG++asnOELWZXi5
	DNGJWxhg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www253.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4ykd-000Kpk-28;
	Wed, 16 Apr 2025 11:08:11 +0200
Received: from [217.6.86.34] (helo=linuxdev.helmholz.local)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4ykd-000Lea-2x;
	Wed, 16 Apr 2025 11:08:11 +0200
From: Ante Knezic <ante.knezic@helmholz.de>
To: krzk@kernel.org
Cc: ante.knezic@helmholz.de,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	knezic@helmholz.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: leds: add binding for WL-ICLED
Date: Wed, 16 Apr 2025 11:06:45 +0200
Message-Id: <20250416090645.11123-1-ante.knezic@helmholz.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20250415-dashing-impartial-baboon-70d086@shite>
References: <20250415-dashing-impartial-baboon-70d086@shite>
X-Authenticated-Sender: knezic@helmholz.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27609/Tue Apr 15 10:56:37 2025)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

On Tue, Apr 15, 2025 Krzysztof Kozlowski wrote:
> >  1 file changed, 88 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> > new file mode 100644
> > index 000000000000..bf79c7a1719b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> > @@ -0,0 +1,88 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-wl-icled.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for WL-ICLEDs from Wurth Elektronik.
> 
> driver as Linux driver? Then drop and describe hardware.
Sorry, I am not sure I quite understand what you mean here? Add "linux LED driver" to
title?

> Also drop full stop
Ok, understood.

> > +
> > +maintainers:
> > +  - Ante Knezic <ante.knezic@helmholz.de>
> > +
> > +description: |
> > +  The WL-ICLEDs are RGB LEDs with integrated controller that can be
> > +  daisy-chained to arbitrary number of LEDs. Communication with LEDs is
> > +  via SPI interface and can be single or two wire, depending on the model.
> > +  For more product information please see the link below:
> > +  https://www.we-online.com/en/components/products/WL-ICLED
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - we,1315x246
> > +      - we,1315x002
> > +      - we,131x000
> > +      - we,131161x
> > +      - we,131212x
> 
> Is that a wildcard in each compatible?
Unfortunatelly, yes. Exact model names are quite elaborate, yet similar enough:
1315050930246   --> we,1315x246
1315050930002   --> we,1315x002
1313210530000   --> we,131x000
1312020030000       we,131x000
1311610030140   --> we,131161x
1312121320437   --> we,131212x

This seemed easier than writing complete model number... You want compatible
expanded to full number anyway?

