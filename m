Return-Path: <linux-leds+bounces-8366-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIgyCxZuGWpzwggAu9opvQ
	(envelope-from <linux-leds+bounces-8366-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:44:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3460106B
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CD4732C8CBF
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BB53CC7F8;
	Fri, 29 May 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em4uxmtz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914151C3F0C;
	Fri, 29 May 2026 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050922; cv=none; b=SL21dcyXJZOyb1mrO1G2+MyjYzOOcZ3i7TbWP12xSNUregYWdIKslSKxW2sWAECHr3N4p3Balezu47iNteApG4RIGShefqa4HCUT1UQ8RMYZVUgpJ8YjKo6ls9/7yBcn8rZXKGUqjF1VgPmBOwZ3qzAqIOoDEwpfPY9BuIEbIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050922; c=relaxed/simple;
	bh=gb0SZWmMeBXhfXRqIou92uTboWGsBGlW5UTsjaq3kZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asotzQVlSPgIG/6V/U1NKekAYZtXfklroRml4iGYtfDdHDiWDfAsrlZB/awSttn44EGYgC3Ebg0Lsru4JAU9yD4K4pVkMOWiy75zPeRdhThCxyV7c1r6ZHwuNhyacKEAzvLebW8Al0l6Nl2RaIARGdMo9pVsM+KZqj90WdXnD7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em4uxmtz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6FB1F00898;
	Fri, 29 May 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780050921;
	bh=/81VudvRrm3p1s1RTSNTNyWiS4UEzvG8GS46X/jp2UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Em4uxmtzY1k6rxjB1apPt95CeGfsxjzf9CJ9egdLVUfW0O0FZUXde/EG9fWv2EwBM
	 dLruv10Rnc8aagJjVA8UHpsj73p5nkQqkDqLMjyDM3UW6MoZaYKGtGfOvw01IQWGtm
	 tzW6pvMcH3pf/HnJTLy/ZKo7sOjLV/uNWvN1lBInrtoi07CFK3b0EIyHJSoX3r+UII
	 an8q+13mv/ifGRUKmN8wZlyn+rjMB9OdX2bU2/UumW/HSH9+tWZYCnsIhG3kjN7K0P
	 CzA6UqWWMDhuZ1reqe7CGQrvK2elag/gxPsyN0M4bS9CuqzGME+7/3/4qOcSjb1xSR
	 495O+ckls7drg==
Date: Fri, 29 May 2026 11:35:16 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Message-ID: <ahlr5PnX5O0tEd6G@aspen.lan>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8366-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9CF3460106B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
> On 5/29/26 12:07, Daniel Thompson wrote:
> > On Tue, May 19, 2026 at 10:43:38AM +0200, Neil Armstrong wrote:
> > > Document the Silergy SY7758 6-channel High Efficiency LED Driver
> > > used for backlight brightness control.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../bindings/leds/backlight/silergy,sy7758.yaml    | 53 ++++++++++++++++++++++
> > >   1 file changed, 53 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> > > new file mode 100644
> > > index 000000000000..80e978d691c2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/backlight/silergy,sy7758.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Silergy SY7758 6-channel High Efficiency LED Driver
> > > +
> > > +maintainers:
> > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > +
> > > +description:
> > > +  Silergy SY7758 is a high efficiency 6-channels LED backlight
> > > +  driver with I2C brightness control.
> > > +
> > > +allOf:
> > > +  - $ref: common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: silergy,sy7758
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  vddio-supply: true
> > > +
> > > +  enable-gpios:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - vddio-supply
> >
> > Sorry for missing this in v2 but is vddio-supply really a required
> > property?
> >
> > It's unusual for supplies to be mandatory (and the it is not mandatory
> > in the driver implementation).
>
> This device is a little bit special, the VDDIO regulator is used to provide
> power for the I/O via the enable input, so basically the enable gpio power
> level is provided by VDDIO.

I don't follow. The EN pin acts as both VDDIO and as an enable but it's
still effectively a power rail isn't it (albeit one with very low current
draw).

It looked to me like the correct way to model to two power rails
going into the chip is vdd-supply (main power supply) and vddio-supply
(EN/VDDIO) I don't understand why a single pin needs both a regulator
*and* a GPIO in the DT bindings?


> This is the recommended way from the datasheet, and I assume it will be used
> like that on other platforms (if it exists...)
>
> This is why it's mandatory and enabled first before setting the enable pin.

It's not mandatory for the C implementation. devm_regulator_get_enable()
will provide a dummy regulator if the property is omitted.


Daniel.

