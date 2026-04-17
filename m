Return-Path: <linux-leds+bounces-7763-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFBeDkEo4mkY2QAAu9opvQ
	(envelope-from <linux-leds+bounces-7763-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 14:32:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39341B3CC
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 14:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2456130A8F22
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05F0372B23;
	Fri, 17 Apr 2026 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dizukVIj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77E279DC8
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429046; cv=pass; b=UstBTnVi1SfztCNfQJ+FlvuZbMLcz44AHXe4QB9MAoN4nwMhwnriFAR0FdsRyHyDDz72KX1IAZqH7QXYz3fL/HmcYRcSwfz/RRpRr8OTU7CrTDLd3JnSgScgKSZAYjhivrOWsLXvXY2kBZwMLzCtABFgjUr3egOBqqy2VTT/xUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429046; c=relaxed/simple;
	bh=ZEh9eTjwFPZ3QnfRFXk0+uFn/4lL3yczZsSKU/HfvO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOKXUtDA09JQ+IfU6TrmVCGtnzgGYl8a9tLt3IR44zrQG0ON6Chjh5jxopqvKj15NAinJFnNFI0RqqUOPx0fxiYbSE1FMA1O1P2dbpAtvtoblIjK2/8R1AtrRzK/SfIWhM9472hfc9Dpj7pLqRvTLyM96lbxiGea7ECZ8EIo2G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dizukVIj; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d77f60944so468635f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 05:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429043; cv=none;
        d=google.com; s=arc-20240605;
        b=VRmAY5YJdnLbUdOkE0zHGtm+NV2nwFmFIJHz3pnzWThMhyMV8c1AAVOeKkllk0tMmW
         l66CF+QmT4eTiI9cgRv0x3noh5irkJ2C5lwKt2ozN6UUxml1bMowNl/8sIb5+77STOkj
         Dm39vyAoRiEs7zHR52qZ9yh9Hvol+fws5T2NZp1oeLGQM7vBpOCV/eEqFKxwp84lpe6c
         xbIhvWl2rnNOcy2T6aUZry1Afwy+zliPTTgFN46I7ObDtzUhIyyh0QCTVZdJ4CcGii1x
         2vcPiJFDkPixmSYXB2rlSx6mnC4sk+smOhtlvbrBhXxomJcmDTWw+hULGeDyjSfIPETr
         8smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        fh=+srbnt3CFQTOWFjzQ39sUYChKZmrxkwLHTVPBThmdp8=;
        b=Dc36gnfhttjNKR+aijtpw5V5WMwTwd2P2TgwzENp88GoZp7betgYJjMYd2QM0ytL6Z
         hdvPpAmXhJZo98iU1xib+axUXo+Wfl+HWUgvyDJZSoa6vJba1hGVKCTkbgD1yRaEQycv
         LtXhctpcXqSPJX/L98aA5Glb6Ld0GAnhkrPlaZN9l8FYx15OGFcWV5QWfqyResaXatZa
         h9CTNPINvjFTYLtm+pCfXLS5drLtYawh0kDbZmeMjf4YlXvYBeXgvd46QTrS11UdqIWD
         z2L/G/jqE+w8NIwHyZp6Eq18I+g3G9J4x9loL2zNqa5rrNXA/VmOrGjoOIXtqfPMNL7o
         ZvvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429043; x=1777033843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=dizukVIjeYZqOYLQNuIA7/7LSPp9W2Dvp17OWDzNpdeQa8NfymHBByQ3YPHm5OQH0k
         CrdHjVqEzUSEzejUMFEY9tMfhHMNe9fBxkEV6Pr6jtbreBjwUDoun/hOZ9TS27cT3c9g
         +krfz2qIe+rNoS5N3XCirWrCtyZjKQz0qg6fT6i8ekALk2rkLtmmtQTQV/X1NVGOLiER
         QuJK/YlDN7YJFVixyu/mGnRThnTu5ufRv8kU60WAUVxc8I+krjjmQmPHANsXGaR3OVeb
         XjU33MLRbKl6oXl9RQaONCMsPPcdE9LUcd2jsybfsP3yXAd+sZh7X1UwCle5MI4xLz4C
         K7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429043; x=1777033843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=lbLOldHKVdj4QSweQwNsi+t4xRsNN+VkYMsKRx73RBoIPoXzt8I1+w4doCtFOnuZ2e
         2zZPFkqk35ZKuj3YWr8CgFPCFYT3DStLpwpAInMnacxtU0tSG3YyR+5Tb2xWoy5YMCYV
         P334r+yR02xzqADA+7GcGAzxpx74tVS2diFkkeeyM3FvueZI3NrccyA86QvPByZ37N05
         vHke69MVoVgvjeZsRkikjY5uDWDhwERLQCaqDTORMDk96DxQWuFkqf9aBBJFqwUmjyJq
         1l/hnkS5DTz0tHA4FaZBXxhELsJLyFFPqNhejHAI91SqGQpVrkNKblWuuJ7H7KqAX61a
         kTMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/65XY6hrkJ9nvcqToizlaXGmpcVvU2XN3W3/QoLcUkGNdD065eA49Ikymi5OUTUtd5AaLVjIH6sK8h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ZOVzTzSc6nch+MatDWUxRNo2icld9nb6bzybVJqBsqdE2PRm
	MmQ89xD258eSsMX4Cbju/Gb3wTkzstNfE7FHFhiychyqjG79atcArbFjigYtkoJ8jmis7yE4D31
	AUdX/1hKj6d5Ax89++2N4yOF2onIdE3U=
X-Gm-Gg: AeBDievGaT4JYYIJ+TCptCiQIBwpWgz6MbBE6vZXU8JzorsLYqHKTSH+g1oj/I5YMUF
	v1RW6T1yKRCbz9OHeZNrY+TAygnBuRolqRjTnMbJhd4zYqleBq2VjmMnuY/YCdCHnWH8e9VMt4G
	4bqHF0ryGJ9tBmoeEm+4g+DKKIhgGBcLGdk+rfCkdsnSqkbTHM2DGT3KXHmAY2VPDWvvX0xdudE
	i8juLph7DhQUiDauojZ03MKnh38GAgvqjxwcKd9ImF8jbFswlTpGrzp9Jld2RLrI0Bsg3/2zVwC
	ixtHqeqhJ+41oYo9d+g=
X-Received: by 2002:a05:6000:2890:b0:43d:77c6:be78 with SMTP id
 ffacd0b85a97d-43fe3e16c4dmr4209904f8f.39.1776429043184; Fri, 17 Apr 2026
 05:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-6-clamor95@gmail.com>
 <aeIkBR4cx54OVmGo@kekkonen.localdomain>
In-Reply-To: <aeIkBR4cx54OVmGo@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:30:30 +0300
X-Gm-Features: AQROBzA1dd8_0NTxSqGN0BqxldytYvwtdWN7VaTpfF2Ohg6pumR-lzUZ706dVSo
Message-ID: <CAPVz0n3wi2yzVc0noYe=5=VR2NWEeyXke3EPKJpSPm81qrpp4Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7763-lists,linux-leds=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.371];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.53:email,devicetree.org:url,0.0.0.0:email,intel.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 9B39341B3CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
3 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Thanks for the set.
>
> This patch should be the first one in the set, or at least before those
> using the bindings defined here.
>

Maybe before conversion, but definitely not the first. I would like to
avoid patch multiplication caused by schema adjustments after every
single commit if possible.

> On Fri, Apr 17, 2026 at 02:42:26PM +0300, Svyatoslav Ryhel wrote:
> > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > LEDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3560.yaml
> > new file mode 100644
> > index 000000000000..460ea1fbc1e5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > @@ -0,0 +1,134 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3560 Synchronous Boost Flash Driver
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter wi=
th two
> > +  1000-mA constant current drivers for high-current white LEDs. The du=
al high-
> > +  side current sources allow for grounded cathode LED operation and ca=
n be
> > +  tied together for providing flash currents at up to 2 A through a si=
ngle LED.
> > +  An adaptive regulation method ensures the current for each LED remai=
ns in
> > +  regulation and maximizes efficiency.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    description: GPIO connected to the HWEN pin.
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description: Supply connected to the IN line.
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [16000000, 23000000, 30000000, 36000000]
> > +    default: 36000000
> > +
> > +  ti,max-flash-timeout-ms:
> > +    description:
> > +      Maximum flash timeout in ms with step 32ms.
> > +    minimum: 32
> > +    maximum: 1024
> > +    default: 1024
> > +
> > +patternProperties:
> > +  '^led@[01]$':
> > +    description: LED control bank nodes.
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description: Control bank selection (0 =3D bank A, 1 =3D bank =
B).
> > +        maximum: 1
> > +
> > +      ti,max-flash-current-microamp:
> > +        description:
> > +          Maximum flash current in uA with step 62500uA.
> > +        minimum: 62500
> > +        maximum: 1000000
> > +        default: 1000000
> > +
> > +      ti,max-torch-current-microamp:
>
> Don't the LED flash bindings already have standardised properties for
> these?
>

Oh, they do! Thanks for pointing out. led-max-microamp,
flash-max-microamp and flash-max-timeout-us. Very nice, I will adjust
in the v2.

> > +        description:
> > +          Maximum flash current in uA with step 31250uA.
> > +        minimum: 31250
> > +        maximum: 250000
> > +        default: 250000
> > +
> > +    required:
> > +      - reg
>
> I'd say the max current properties are required as well, same for the
> timeouts. Or make the lowest the default. The lowest values are very seld=
om
> used in practice though.
>

I have transferred from the driver which uses maximum values as
default one. I can change to minimum if needed, that is not a big
deal.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@53 {
> > +            compatible =3D "ti,lm3560";
> > +            reg =3D <0x53>;
> > +
> > +            enable-gpios =3D <&gpio 28 GPIO_ACTIVE_HIGH>;
> > +            vin-supply =3D <&vdd_3v3_sys>;
> > +
> > +            ti,peak-current-microamp =3D <16000000>;
> > +            ti,max-flash-timeout-ms =3D <1024>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            led@0 {
> > +                reg =3D <0>;
> > +
> > +                label =3D "white::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +
> > +            led@1 {
> > +                reg =3D <1>;
> > +
> > +                label =3D "yellow::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +        };
> > +    };
>
> --
> Kind regards,
>
> Sakari Ailus

