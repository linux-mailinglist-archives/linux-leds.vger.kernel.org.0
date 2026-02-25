Return-Path: <linux-leds+bounces-7029-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN0XF2Mrn2kOZQQAu9opvQ
	(envelope-from <linux-leds+bounces-7029-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:03:31 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC619B249
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 18:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10CA330518CC
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE243AE6E5;
	Wed, 25 Feb 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTOBOREj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD93D7D9C
	for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038671; cv=none; b=Hw4VsXAzK5uP3VLZBPdB0yfUZ9VQav6xzmJ5mItPj73jk+sI8NY1rZ3IFAwbG/FMfwz2+HTjFkXnUuca2XG7LcqDwjq61by5TEm2L8jm5uqcPf9PUe1ZTGCdb8+XQhxbC1afYGQKkPkrb4jbAH5ZJrNkvv8oZxhU5UQnUKiLcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038671; c=relaxed/simple;
	bh=Yps99FyS901aqnCa3oM35uRJ1n1Iu2fP9xlC6LYC6x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7c/znswqm4jFFuU6NaidcQvci9y5ILVueRBLnCUnQ1vl5WBTP27Wa71PEvUBKMwHfI6V9cd/a/VAtTgn9QABohitvfrRlg+jK73f1JiD4EprvtJ5msMRYHXOp+KXMECBDtkeQGPU3/lT4EYwO26tRiGNBnMh4S+3WhXjwtCn1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTOBOREj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371119eacso81036935e9.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Feb 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038669; x=1772643469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=mTOBOREjXjHu4JDzV7GBa5dTVodgk2RQ4QwVnoHVDeWSPDBWu1L0rJH9heg6mqSQap
         lvMGm/dobtxX1PfOo9waM4JYSQHCgH6ZSNPM5rokWcqerOOB4PBzPm52ZvXkC1Q8f6pP
         G8GP9yXnzD0MuC4rZkvgAXQQIwK4wyFSEPIXUwzoXyhupac11xmXjRr0ijLZONQbvAJ+
         3UqWt1g5IeWnyY9rjnXFeRRYgsSTat0rPlUPNfs2kpfOPnugbsuNEyHc6IoXLXHGZZkm
         +nCcWuDcrouUanz1pAz+TQpzf10GoRO/59S1ZG06hqE0UlzXqUnAPiJkFhpsh9lcuXGI
         zW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038669; x=1772643469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=I5MTwLwE2tc1X/feUNa2wcvh/5dXTlIpwf8/VImKRM0VfcyN9JmOPUsOGoleBdeFJ6
         gw24oJ+V3MK6uaa6BxRUfaJiSo8O8gXRGM69G3c4iZvAKCY+TY2ag2Bvr7/ItnOwNRvO
         r71LruvPNh9MqVucrPTpCCyRbI2srfGtd+LTEQkdXptXR7OaOZ/NrIRaOoaHKJXsLqL4
         ckelcgougWUBPyiFrRwFEGbdW9sAD8YfS4ao/E7626DmXiASU1j84dHxQ8ShXQeK0xhb
         NEEHlU3bS95to4Jr2P++dsDXdxaI3K6V0x5xebr3mRAD+vV4Osl+xV3meoDKwVhiabQU
         z+LA==
X-Forwarded-Encrypted: i=1; AJvYcCURoZY01qM8afREKBdat236Dxu+YsGA5qlEfTzw3YzuWEDh/MpcoqT18jeFjlBZCzB4HfPZ/i3AFXUd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxAUSZ2jAq7c1uOxLR3XmIiSbpT7YMEM+jT19/yxBZ2PuSvws
	Hk8eMV80Jg+5enZ/fu66ExY3JenX8ZpccvWGz8vN9iG815rzcus9ZQPf
X-Gm-Gg: ATEYQzypkBwxBvlS1WzZkOcgu+cQa/iDHYbIc3wn47w0YLsMZrkLWYwFPS1KeGSz4vV
	KslzJgzif0cWLJI/0Z23wXi6CXia0PWaGtGSPJXdRybSU0LLWahxpz84L0bZ53pQAoIcb119+EJ
	cjlHq9kmjRhApLAH9PTc7ciBWIRFKrkru2O+oECliT2OKXuCWFmNcOOMnXsrLoVGo8vN3icI3Z+
	QJ+KAsxk9dvYYEs1LeD+VepJ8nXzvLr72xyNrW1kteyTYuIPWHHggB45jLuV7WCqTBMCvLk6U6q
	XirbCy5zdxdXygZGNmdUGLabVI7SzSE4FVbyRqrd0jIljmV/VAH7qxpDhKG8daA8E1p8D8715U5
	viwmF+sm+tMwzADqx+46JN8Tp7Ib4LotCExWKFuqXzz48PMs4xgB8IoYImAPpixsnikqcgZUi9l
	aJnxNDAaSf5LqRyusycFZZAxsvRyawZlqLBtnxamngY92avKng/VV8JOuYXSpE5MiwKnAnz6MjP
	DSFORnbyGcDqPpUQA+HnG9DaC2l
X-Received: by 2002:a05:600c:a016:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483a962e470mr290674845e9.17.1772038668640;
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7141e4sm86300175e9.7.2026.02.25.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 wens@kernel.org
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Wed, 25 Feb 2026 17:57:46 +0100
Message-ID: <2818809.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-3-wens@kernel.org>
 <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7029-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[0.30.136.104:query timed out,0.30.169.56:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[thermal-sensor.0.30.169.56:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.30.163.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.30.169.56:email,0.30.136.104:email]
X-Rspamd-Queue-Id: 0EEC619B249
X-Rspamd-Action: no action

Dne sreda, 25. februar 2026 ob 17:14:51 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> On Thu, Feb 26, 2026 at 12:08=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > The A523 SoC family features an LED controller that is identical to the
> > one found on previous SoCs.
> >
> > Add a device node for it, and one of the possible pinmux settings. This
> > setting is used on the Avaota A1.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index 09bd149bbf51..b8263e2872af 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
> >                                 bias-disable;
> >                         };
> >
> > +                       /omit-if-no-ref/
> > +                       ledc_ph_pin: ledc-ph-pin {
> > +                               pins =3D "PH19";
> > +                               function =3D "ledc";
> > +                               allwinner,pinmux =3D <5>;
> > +                       };
> > +
> >                         mmc0_pins: mmc0-pins {
> >                                 pins =3D "PF0" ,"PF1", "PF2", "PF3", "P=
=464", "PF5";
> >                                 allwinner,pinmux =3D <2>;
> > @@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
> >                         #reset-cells =3D <1>;
> >                 };
> >
> > +               ledc: led-controller@2008000 {
> > +                       compatible =3D "allwinner,sun55i-a523-ledc",
> > +                                    "allwinner,sun50i-a100-ledc";
> > +                       reg =3D <0x02008000 0x400>;
> > +                       interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
> > +                       clock-names =3D "bus", "mod";
> > +                       resets =3D <&ccu RST_BUS_LEDC>;
> > +                       dmas =3D <&dma 42>;
> > +                       dma-names =3D "tx";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                 ths1: thermal-sensor@2009400 {
>=20
> I Forgot to rebase this patch before the thermal sensor one in my tree.
> I can fix this when applying, so please still review the patch.

Values are correct, so with a rebase this patch is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ChenYu
>=20
> >                         compatible =3D "allwinner,sun55i-a523-ths1";
> >                         reg =3D <0x02009400 0x400>;
> > --
> > 2.47.3
> >
>=20





