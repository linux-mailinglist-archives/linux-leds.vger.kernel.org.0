Return-Path: <linux-leds+bounces-6926-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMtMNDkZi2ljPgAAu9opvQ
	(envelope-from <linux-leds+bounces-6926-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 12:40:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34311A573
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 12:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FEDF300C355
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365C631B119;
	Tue, 10 Feb 2026 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFK1gLAO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171031A7E1
	for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723633; cv=pass; b=N4b+CqnCSU91lksUEiHxuOECcGncvGye6JiVSSDo+KDMfdbDNozLwQ2WXUFIrab5NJUVsl2DMplltWLIZ9hEKSayn/QtPcw02+MeY0XzV22ssmhdt5neIkqjFrNgQd2J3GTUD1C0Z8uXuGloU6/NZpYiKenUfmZ23PNhrIZa65Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723633; c=relaxed/simple;
	bh=6/FnaCDrg0Je5LmR0DbI9pHLZ0ePao0o0SrXDi9lfBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eChJZVsJPHFMQxqOT5RyCYIezOqEKeqi57DNvCMlURd+FFmYL1xkaY2BIZCY/WYf0m2TFz4WYftIZ1S8hrrLUTbXRaCrXRYVaVO6xRRvrAMCm/fALi72QQ22PiAQY0iFLuKMoexF8PG6TgzmQRfn+M8yvCV+qp5XaQpNGFGrE24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFK1gLAO; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43626796202so592740f8f.3
        for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 03:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770723630; cv=none;
        d=google.com; s=arc-20240605;
        b=LCFvVVIArLblR1tdgNt1MbjRAlrSjQV4J+WzjVr411LI14dwLl5LAP5bL2Tk8X4pki
         dA9ihqWDeWPWf5GHshvOl1V4Mn8TDEej8aadFQe5y44ktgoHZjAniTaZBIZPC3n+xpYY
         LZm9hmoMk2iIfL3oxxkxIpYCy/9f1Nj1PkzfVH6n1ho7Rr5xlnvbPN0GMe67dZmhQ2fw
         zsh5J7KknYbb45WxAEwo2JiRxaW1gaWaoaxL/nI42CoU5kTq8A2kEcMYnugdxzGc0stT
         ZKg6lo8hF2Exz+bLdCegQiOI8H/IPj4gBz48KWSdxXJcol6qh1LwWBiBzNKEBh9+VI+F
         l/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6R3QvEhmtCk9xuXNSfNCHPXokJj1HMXLUrDoDJsbjjM=;
        fh=eSTykudij+HFmXzJdnph1+D6kJoOrJ18oJKTjy47mJ0=;
        b=SYzPYQQcvSMPhUPTWYKEgl+dMtyEGCf2FidWtHGGca25HixI37rzHVqesON1FOJj3+
         LTkH34QkOvJgzpEQodFyI6TLKA8dJHVz+WTA7+VOrMwoB2VdYI7YzMeM5d9eGG88oU88
         nVrDVRwbBWyp1nTGFA0aHbgiATTJcdwKxFy1hvofENGnaKcHPaZXbad2zSODcFUx8p++
         khlorvQLQmfOf46rJbEtbsxgjqCaVJopOzGMvFEheXekTfpfH3P2/xdd63f1XAijlpD+
         tQZyRQ8mJcOa5LurvXY65q8s+DXc9FdpMzgv6Xt3jqC8pJyixrulF6NPMpuICrwU6L4R
         zCKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770723630; x=1771328430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R3QvEhmtCk9xuXNSfNCHPXokJj1HMXLUrDoDJsbjjM=;
        b=bFK1gLAORXD86WhbOvJtdsyqyLiPceDOd8Xzaj1QbHwim3MON6hwIEZADsC8rb0b6+
         tpYqfPJBhB/xTXqXRK8YhV2macbt7xQiGhkRJU9TvQ8Uw7fYvdMqL3w0ktdKN+dI82D8
         Gw0bGj4rgBMs3CmpgiTnXc+0UjmlQ2e4O7wXW5PgqIKs3YoiX8Z1KZW2EvmVUp1q/h/+
         Y29WNpMgZKDBbP5uAezhqvqS8EUuUMy0vkqsI15Ws/LWtNuKBPA9hnpcSX8H7nZtXHDK
         WhdbuP9qEg1WgY7ssOfcMEoCDcQ5pkPxpXDdv+PHaU6ZQz/6XhU9NJXH09NXweYpO0mH
         5r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723630; x=1771328430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R3QvEhmtCk9xuXNSfNCHPXokJj1HMXLUrDoDJsbjjM=;
        b=a1NYlc0Mh6K8XplSBjI4dx9yot02eAWBotx1/gzdpiIKOMQpayT5YrYgQwCRamaDrN
         pHmxUUcvJu7BB0vmn2lF/PiDPbbmQc1DklCfe5O1w2QgRUENKzGx05ny8fRKD2ifXOEK
         nau4WrncRLeXahqWBh7eFnCHPOQm/7uVypOyRRy+MQ5JiOUkNjOnn3P/Tu+wFZPQZL26
         8UGIz2a/po0L2oy172DxZ2Kl/jmYT1GnXwx2IRHAAKOHRarT2B4OFCV/UTCYK08Owlq3
         GfIq55fc6hlGBLQcn3G+gLzThMGK/jpbwoyGAKhL8MgVC9JcE7sPen8nDtkl36UNxwyn
         6JfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXmfdoKtcJCab2XYLLqwcmMnSNJq/7PJ2YYMBDd3Ijj5JOUDfHlgT61pb+uRX6QD5VrzP4msTCGItR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LFBQGPbOIYjAf+fWW+cnpkVkHeV/QmNV7GhX9MeTQSfdIncQ
	2uwtICyQf/DVJS08BJth/rULsPLYl9bNWEVh24wpVtrXt62WzIIiCwJL3WFpMxWVcRtg8IdyyGN
	8wswYS4OW4bLSLPFeLn/9zJx1X6ljTtM=
X-Gm-Gg: AZuq6aLBi2lc/BcY8aYet/EOMQFp0lio5nf+lyHKuhLn0tG5KHRO1UbK7fuNrOOQkvW
	f4UFrF9A84lpLZIeE5ZB+p9ETIvOWKbQ4fgq3idpaynfS/Jf+9Pkhv0JajtRrSfr+zsVcV9hKm5
	pHYAsLleI5T8AheQfsliLonmKRD/8MqENT5NBhSzyEmndy4T09gcjpUCqGsVQhHA4WVIJGXDPeW
	MVmwTw5OOBcGYiEueB8hlii6Z4oDSqu1fzFACEE9wZWLzmaPNpeGvp6vaTZkof8YnPegRLRoc3B
	knFuMwFK
X-Received: by 2002:a5d:5690:0:b0:436:3563:499c with SMTP id
 ffacd0b85a97d-43635634ba8mr10638942f8f.8.1770723629941; Tue, 10 Feb 2026
 03:40:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104407.116426-1-clamor95@gmail.com> <20260209104407.116426-4-clamor95@gmail.com>
 <20260210-sexy-grumpy-sambar-44edd2@quoll> <CAPVz0n3fizf=r58Fr4YQ6pnjHq5p-7yFz95obss6w6x0bfgnDg@mail.gmail.com>
 <d1973810-d3f5-4ed7-ba0f-6bf93c1c7f3d@kernel.org> <CAPVz0n1foyy9g7MAurSAyLCUHTzrPPu0ceqy9YpcDA9uzgjGng@mail.gmail.com>
 <cb91898e-10f1-4d64-bace-41bbed08179b@kernel.org> <CAPVz0n0O_uSAPYFtg8s+Ni0buyGJys6d0jEMob6SNWx-aeKUEw@mail.gmail.com>
 <dc7acd1e-91e8-492c-8665-cb680c6164fd@kernel.org>
In-Reply-To: <dc7acd1e-91e8-492c-8665-cb680c6164fd@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 10 Feb 2026 13:40:18 +0200
X-Gm-Features: AZwV_Qj_PU3fakrGR59GUwZHjil71UqQv1RxthP-ur70Fb66TccCFSfBCI4qmfU
Message-ID: <CAPVz0n0u_0ZukcKXt0QpiyCMhWsg2VE-dE19wDCbRQvBvVOf+A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: mfd: document ASUS Transformer EC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6926-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: ED34311A573
X-Rspamd-Action: no action

=D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:24 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 10/02/2026 12:14, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:04 =
Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 10/02/2026 11:59, Svyatoslav Ryhel wrote:
> >>>>>>> +  asus,clear-factory-mode:
> >>>>>>> +    type: boolean
> >>>>>>> +    description: clear Factory Mode bit in EC control register
> >>>>>>
> >>>>>> Why would this be a static/fixed property over lifecycle of all de=
vices?
> >>>>>>
> >>>>>
> >>>>> Specify pls.
> >>>>
> >>>> Provide rationale why we need to clear it every time, not once. Or a=
ny
> >>>> other rationale why we would accept that property.
> >>>>
> >>>
> >>> Cause it is done by original Asus code and Asus did not provide
> >>> schematic or any data apart from downstream source regarding this EC.
> >>
> >> So that's a no. downstream code which is poor quality, not following D=
T
> >> rules at all, is never an argument for a DT property.
> >>
> >
> > This property indicates that this controller on every reset restores
>
> Implied by compatible then and you can drop the property.
>
> > factory bit hence it must be cleared. Bit is write only and cannot be
> > detected. EC remains in factory mode which blocks its functions.
> >
> >>>
> >>>>>
> >>>>>>> +
> >>>>>>> +  battery:
> >>>>>>> +    type: object
> >>>>>>> +    $ref: /schemas/power/supply/power-supply.yaml
> >>>>>>> +    unevaluatedProperties: false
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      compatible:
> >>>>>>> +        const: asus,ec-battery
> >>>>>>> +
> >>>>>>> +    required:
> >>>>>>> +      - compatible
> >>>>>>> +
> >>>>>>> +  charger:
> >>>>>>> +    type: object
> >>>>>>> +    $ref: /schemas/power/supply/power-supply.yaml
> >>>>>>> +    additionalProperties: false
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      compatible:
> >>>>>>> +        const: asus,ec-charger
> >>>>>>> +
> >>>>>>> +      monitored-battery: true
> >>>>>>> +
> >>>>>>> +    required:
> >>>>>>> +      - compatible
> >>>>>>> +
> >>>>>>> +  keyboard-ext:
> >>>>>>> +    type: object
> >>>>>>> +    description: top row of multimedia keys
> >>>>>>> +    additionalProperties: false
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      compatible:
> >>>>>>> +        const: asus,ec-keys
> >>>>>>> +
> >>>>>>> +    required:
> >>>>>>> +      - compatible
> >>>>>>> +
> >>>>>>> +  led:
> >>>>>>> +    type: object
> >>>>>>> +    additionalProperties: false
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      compatible:
> >>>>>>> +        const: asus,ec-led
> >>>>>>> +
> >>>>>>> +    required:
> >>>>>>> +      - compatible
> >>>>>>> +
> >>>>>>> +  serio:
> >>>>>>
> >>>>>> All of these children are pointless - no resources. Drop all of th=
em,
> >>>>>> it's btw explicitly documented rule in writing bindings.
> >>>>>>
> >>>>>
> >>>>> They are all needed to be able to disable them individually from th=
e
> >>>>> device tree if needed.
> >>>>
> >>>> They should not be disabled from DT, so they are not valid here. The
> >>>> given EC for given device is fixed/static. Does not change.
> >>>>
> >>>
> >>> Have you considered a possibility that function may be
> >>> disabled/unrouted within the controller. By the vendor.
> >>
> >> And then it is implied by the compatible, so no need for any of that.
> >> Otherwise, if it is not specific per device, then specifying it for DT=
S
> >> for all devices would make no sense.
> >>
> >
> > So you propose introduce a compatible for every single ec used in
> > transformers instead of simply disable unpopulated functions? And how
> > then battery and charger can reach monitored cell if they have no
> > dedicated node?
>
> Just like for other bindings for nodes without resources, fold into
> parent. This is already explained in writing bindings, so you could have
> just read that. I will pass with answering more questions till you read
> that doc.
>

Unfolding asus,ec-pad and asus,ec-dock will result in this list:

asus,tf101-dock-ec
asus,tf101g-dock-ec
asus,sl101-pad-ec
asus,tf201-pad-ec
asus,tf201-dock-ec
asus,tf300t-pad-ec
asus,tf300t-dock-ec
asus,tf300tg-pad-ec
asus,tf300tg-dock-ec
asus,tf300tl-pad-ec
asus,tf300tl-dock-ec
asus,tf600t-pad-ec
asus,tf700t-pad-ec
asus,tf700t-dock-ec
asus,tf701t-pad-ec
asus,p1801-t-pad-ec

with minor variations in populated cells. Is this acceptible?

>
> Best regards,
> Krzysztof

