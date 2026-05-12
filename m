Return-Path: <linux-leds+bounces-8082-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKUKHSMpA2qw1AEAu9opvQ
	(envelope-from <linux-leds+bounces-8082-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 15:20:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FA521053
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CA7232DA2D6
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 13:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384823905F8;
	Tue, 12 May 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kojBv8oc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C4349CF7
	for <linux-leds@vger.kernel.org>; Tue, 12 May 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590838; cv=pass; b=IhjCSIp/fCIf9SOIFbVgCmiPUec+PwkmU1doPmwaTigkR+zPVTJNf8FMIRKEV6YwX0L9w7KwoHAZmdn3zPbqnnN51JKTPSvurGekZ4D+G66gKsetDWwC2vgSXWc3vCkY/dqtuXTv4zyZE29rtSvH2If+W2xzjPNozy2eDinMzto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590838; c=relaxed/simple;
	bh=YuM53joYsuqA/fqOKsW+xz9cxbWMg+9daWwdkzmHkN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKjoE2mi1egdl31ArAUo1vENyZ5suWAsCsY1DGBuoF1ymYAq8srNHu9Nw51nJD/GgPrRfSsNbbdngSuw7OCi5GSB9sZ0AxaukYb9juG7U6Y5Rc+F1zFhb/uEwcQmc6S7ZUPEghTReY9VIs7CfyG75f0gdWQZ8pcQubxUjXMU51Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kojBv8oc; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9452071eec.0
        for <linux-leds@vger.kernel.org>; Tue, 12 May 2026 06:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778590835; cv=none;
        d=google.com; s=arc-20240605;
        b=EPpw8ZQNhcomvJq5cjSPtTZQ2ua72RoKsFFKA8K+Of5Egq4ddOZcgq/KCJ8Tn8OUjq
         PlP28QRenviTtWZdfKe+XuGn04pfZneVGikmAa6uBCZdMV7t6Bs61Xkw7qx3+BcsEA7Z
         1C1yXHsOvBOzbc/BMT0vCy0NmPWaRp5C4HpedWGNfkDp7BvlLkaDphz0vLHKqX86Abjv
         Z09dzjH2UuLIhSSs9bd6aeiCjYjCA7F9CiP+ECyOqbTP1IOviBBgPXVzc+2nerpTrrCz
         j+HUXACi9y2IyQ2SV4flRIXM8rhMQh3OmQnSJ+dX0GFeR0wJdzeppVFLF1b4L3/Eb+OD
         HxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2IS5oluGQ9rzg5bXFenlg6gcPX4ICtDWNMpGHTlzVao=;
        fh=YGtQr/uqMIRwFisPJ0GvLDrsq8Z+eSSGelEoWor/5NU=;
        b=lv5OuIHfjzjrWzKhov96UmWu6Yeu72gYC+6f9vDN2HYQEhhekBDGHDzx5HMx9Fryv8
         HXwWnq18UIzPA/yXpnoKSbRxUYW8tATURHh5Voj2uX30WPJgTHK9Xj/Z4z+yqiF/1/K/
         C74/Os299UU9o7r0xzPC9Fn0G6gtr+ciPu4P4O7kS2p5Tm4ZqtBOHMl7mEXfRTFFaJv2
         l3rSQURX/C0tDxvOXDWf04C2m8P/zDcxc7ttt8G/Cu0xOc2iho4oDswhrOGAfY/5yGPP
         cseOGxv+yGKXNMj1b83Kz+E5LuuFsCQFCHhgwN4e9+m7nF8hFdfpidGVZF12wr5yiPTg
         /0MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590835; x=1779195635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IS5oluGQ9rzg5bXFenlg6gcPX4ICtDWNMpGHTlzVao=;
        b=kojBv8ocv5FfzX8wx0SpcbJluVbvKsL7UUpwx5Z3LPvFc7lmqYncPJH7/YcKjDUHGe
         gDfyIoX+BbEx5JoYwNth1+b5i5Fs0FrgDeXyZiwE1YuNc+zY6uABEk1W2GVOGPKWC+Yl
         Y0mWvGYv8E9QOdt6Mn81YWAsZNniik2uxMDMkMPkz4ZPpkJUHI7eGdJPkTNYf2oly4pv
         7xI3UGUmESwzjtxLTxgZ2GnD/Vodrr7uwzROpmY4cw0Q1N5jZzZqCnCNWEKtbJafmfKw
         +nCpu4UB4JACewnyKQcZfE9r7OQX8Pump+6e+X8X3a/2INUn9eWwJYW7ls+cIccXMsGh
         OQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590835; x=1779195635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IS5oluGQ9rzg5bXFenlg6gcPX4ICtDWNMpGHTlzVao=;
        b=jdPmv6MN/iekm35CdQrGsS1fyS3P9yCBrriQus2YxMuXQZa4lrL9Oqy63RUznJVHiN
         KsqwLWPZLNXpdq8ZfyB1tbh7rKhRG5Trs9Ots1in6DwYDTSbsgcloKwKbAgKTMlyhyqp
         Heb6dEAvLwwjVBDIsz044IJlseUtikIAZoeTfKkOpyJuMCfaq8OCwAyXLPtvGYZlg9Y6
         yZSp9N5TQXcV2pKEtiEpCK3QoLB+v+mtErk6hx0Tt6ZbaQQL8Beav1TVh/c1TJB+AkI1
         x5Y9WuTyPVZ1za6ctbZpFtYHZfnhZNmjoOIxl911/RnugP+mk2N5hsbFc+HE1ye8gI/k
         dZyw==
X-Forwarded-Encrypted: i=1; AFNElJ/LCzFlC8hhFtAoVgHeV5iJWKTiFbchFHfUyf4ugdf8inHcp5ID54rO5pL7IQ6XslppsOD5SzTKo6AX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rkwnG6cekxcDU3PGUoUWUEsa351e0CdA/SA8QGgxTk6R6n+V
	U2tcCRIUr2SRt8ItMiUbh+R5mM3osiHe8HV81ttiC1JZ6zcmh9Ntrm1bqVcffqGtU60YS7CzcCU
	a3CzuS6V9EaqWYtvqoebQU/+5Cn7W4wvUtA==
X-Gm-Gg: Acq92OHWwIpX2qM0sVY7KRpuorH7/2D+dYwt8a3rjM1ISFCpykb6/+9UIohNb0pdYF6
	yk4q0d4mu49a/tvUkoDrbw3SRGwz9fnAoOpFj5DMA9/QWxR76tHqRf7TfpC243Q5H3hCWTsK9Wv
	w7iqmtxvn+dvUFb0owiOeUb1clUZ5UWhuADaak8uVaBXdD9BtS6TMF5zI2D9+m6JCi+HLjcjMdJ
	G8WsTv9T2Y7jRhFS2/sWzpZT/U54cMSSEi9vV3O6ydtWUj/Bm0wopTv7q22bkXfpjT+UuzBPU9V
	6n38bcN6
X-Received: by 2002:a05:7300:ec01:b0:2e1:e3e6:2909 with SMTP id
 5a478bee46e88-2f54dc8dfdcmr12882765eec.9.1778590834832; Tue, 12 May 2026
 06:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-4-clamor95@gmail.com>
 <20260512125309.GA1476682-robh@kernel.org>
In-Reply-To: <20260512125309.GA1476682-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 16:00:23 +0300
X-Gm-Features: AVHnY4Lg9-rZZxak_7A8-rgTbdgv1Xf5Fk-dRQ_iaShma4n8Z6iLa9Gayv32ho8
Message-ID: <CAPVz0n0QSvht+_ejbErDsf0o6Bt1STynVydJOemcSYXrr-TgHw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] dt-bindings: mfd: motorola-cpcap: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B71FA521053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8082-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 15:5=
3 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 10, 2026 at 02:08:01PM +0300, Svyatoslav Ryhel wrote:
> > Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/mfd/motorola,cpcap.yaml          | 414 ++++++++++++++++++
> >  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
> >  2 files changed, 414 insertions(+), 78 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpca=
p.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpca=
p.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml =
b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > new file mode 100644
> > index 000000000000..7f257f3a1a5a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > @@ -0,0 +1,414 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola CPCAP PMIC MFD
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: motorola,cpcap
> > +      - const: st,6556002
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>
> There aren't any child nodes with an address. These 2 can be dropped.
>

I will adjust in v6 if there will be need in one.

> > +
> > +  spi-max-frequency:
> > +    maximum: 9600000
> > +
> > +  spi-cs-high: true
> > +  spi-cpol: true
> > +  spi-cpha: true
> > +
> > +  adc:
> > +    $ref: /schemas/iio/adc/motorola,cpcap-adc.yaml#
> > +
> > +  audio-codec:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      interrupts:
> > +        items:
> > +          - description: headset detect interrupt
> > +          - description: microphone bias 2 detect interrupt
> > +
> > +      interrupt-names:
> > +        items:
> > +          - const: hs
> > +          - const: mb2
> > +
> > +      "#sound-dai-cells":
> > +        const: 1
> > +
> > +      VAUDIO-supply:
> > +        description:
> > +          Codec power supply, usually VAUDIO regulator of CPCAP.
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: port connected to the Stereo HiFi DAC
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: port connected to the Voice DAC
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - interrupts
> > +      - interrupt-names
> > +      - "#sound-dai-cells"
> > +
> > +  battery:
> > +    $ref: /schemas/power/supply/cpcap-battery.yaml#
> > +
> > +  charger:
> > +    $ref: /schemas/power/supply/cpcap-charger.yaml#
> > +
> > +  key-power:
> > +    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml#
> > +
> > +  phy:
> > +    $ref: /schemas/phy/motorola,cpcap-usb-phy.yaml#
> > +
> > +  regulator:
> > +    $ref: /schemas/regulator/motorola,cpcap-regulator.yaml#
> > +
> > +  rtc:
> > +    $ref: /schemas/rtc/motorola,cpcap-rtc.yaml#
> > +
> > +patternProperties:
> > +  "^led(-[a-z]+)?$":
> > +    $ref: /schemas/leds/motorola,cpcap-leds.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - spi-max-frequency
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/input/linux-event-codes.h>
> > +
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        cpcap: pmic@0 {
> > +            compatible =3D "motorola,cpcap", "st,6556002";
> > +            reg =3D <0>; /* cs0 */
> > +
> > +            interrupt-parent =3D <&gpio1>;
> > +            interrupts =3D <7 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <2>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            spi-max-frequency =3D <3000000>;
> > +            spi-cs-high;
> > +
> > +            spi-cpol;
> > +            spi-cpha;
> > +
> > +            cpcap_adc: adc {
> > +                compatible =3D "motorola,cpcap-adc";
> > +
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <8 IRQ_TYPE_NONE>;
> > +                interrupt-names =3D "adcdone";
> > +
> > +                #io-channel-cells =3D <1>;
> > +            };
> > +
> > +            cpcap_audio: audio-codec {
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <9 IRQ_TYPE_NONE>, <10 IRQ_TYPE_NONE>;
> > +                interrupt-names =3D "hs", "mb2";
> > +
> > +                VAUDIO-supply =3D <&vdd_audio>;
> > +
> > +                #sound-dai-cells =3D <1>;
> > +
> > +                ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    /* HiFi */
> > +                    port@0 {
> > +                        reg =3D <0>;
> > +
> > +                        cpcap_audio_codec0: endpoint {
> > +                        };
> > +                    };
> > +
> > +                    /* Voice */
> > +                    port@1 {
> > +                        reg =3D <1>;
> > +
> > +                        cpcap_audio_codec1: endpoint {
> > +                        };
> > +                    };
> > +                };
> > +            };
> > +
> > +            cpcap_battery: battery {
> > +                compatible =3D "motorola,cpcap-battery";
> > +
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <6 IRQ_TYPE_NONE>, <5 IRQ_TYPE_NONE>,
> > +                             <3 IRQ_TYPE_NONE>, <20 IRQ_TYPE_NONE>,
> > +                             <54 IRQ_TYPE_NONE>, <57 IRQ_TYPE_NONE>;
> > +                interrupt-names =3D "eol", "lowbph", "lowbpl",
> > +                                  "chrgcurr1", "battdetb", "cccal";
> > +
> > +                io-channels =3D <&cpcap_adc 0>, <&cpcap_adc 1>,
> > +                              <&cpcap_adc 5>, <&cpcap_adc 6>;
> > +                io-channel-names =3D "battdetb", "battp",
> > +                                   "chg_isense", "batti";
> > +                power-supplies =3D <&cpcap_charger>;
> > +            };
> > +
> > +            cpcap_charger: charger {
> > +                compatible =3D "motorola,mapphone-cpcap-charger";
> > +
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <13 IRQ_TYPE_NONE>, <12 IRQ_TYPE_NONE>,
> > +                             <29 IRQ_TYPE_NONE>, <28 IRQ_TYPE_NONE>,
> > +                             <22 IRQ_TYPE_NONE>, <21 IRQ_TYPE_NONE>,
> > +                             <20 IRQ_TYPE_NONE>, <19 IRQ_TYPE_NONE>,
> > +                             <54 IRQ_TYPE_NONE>;
> > +                interrupt-names =3D "chrg_det", "rvrs_chrg", "chrg_se1=
b",
> > +                                  "se0conn", "rvrs_mode", "chrgcurr2",
> > +                                  "chrgcurr1", "vbusvld", "battdetb";
> > +
> > +                mode-gpios =3D <&gpio3 29 GPIO_ACTIVE_LOW>,
> > +                             <&gpio3 23 GPIO_ACTIVE_LOW>;
> > +
> > +                io-channels =3D <&cpcap_adc 0>, <&cpcap_adc 1>,
> > +                              <&cpcap_adc 2>, <&cpcap_adc 5>,
> > +                              <&cpcap_adc 6>;
> > +                io-channel-names =3D "battdetb", "battp",
> > +                                   "vbus", "chg_isense",
> > +                                   "batti";
> > +            };
> > +
> > +            key-power {
> > +                compatible =3D "motorola,cpcap-pwrbutton";
> > +
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <23 IRQ_TYPE_NONE>;
> > +            };
> > +
> > +            led-red {
> > +                compatible =3D "motorola,cpcap-led-red";
> > +                vdd-supply =3D <&vdd_led>;
> > +                label =3D "status-led::red";
> > +            };
> > +
> > +            led-green {
> > +                compatible =3D "motorola,cpcap-led-green";
> > +                vdd-supply =3D <&vdd_led>;
> > +                label =3D "status-led::green";
> > +            };
> > +
> > +            led-blue {
> > +                compatible =3D "motorola,cpcap-led-blue";
> > +                vdd-supply =3D <&vdd_led>;
> > +                label =3D "status-led::blue";
> > +            };
> > +
> > +            cpcap_usb2_phy: phy {
> > +                compatible =3D "motorola,cpcap-usb-phy";
> > +
> > +                pinctrl-0 =3D <&usb_gpio_mux_sel1>, <&usb_gpio_mux_sel=
2>;
> > +                pinctrl-1 =3D <&usb_ulpi_pins>;
> > +                pinctrl-2 =3D <&usb_utmi_pins>;
> > +                pinctrl-3 =3D <&uart3_pins>;
> > +                pinctrl-names =3D "default", "ulpi", "utmi", "uart";
> > +                #phy-cells =3D <0>;
> > +
> > +                interrupts-extended =3D
> > +                    <&cpcap 15 IRQ_TYPE_NONE>, <&cpcap 14 IRQ_TYPE_NON=
E>,
> > +                    <&cpcap 28 IRQ_TYPE_NONE>, <&cpcap 19 IRQ_TYPE_NON=
E>,
> > +                    <&cpcap 18 IRQ_TYPE_NONE>, <&cpcap 17 IRQ_TYPE_NON=
E>,
> > +                    <&cpcap 16 IRQ_TYPE_NONE>, <&cpcap 49 IRQ_TYPE_NON=
E>,
> > +                    <&cpcap 48 IRQ_TYPE_NONE>;
> > +                interrupt-names =3D "id_ground", "id_float", "se0conn"=
,
> > +                                  "vbusvld", "sessvld", "sessend",
> > +                                  "se1", "dm", "dp";
> > +
> > +                mode-gpios =3D <&gpio2 28 GPIO_ACTIVE_HIGH>,
> > +                             <&gpio1 0 GPIO_ACTIVE_HIGH>;
> > +
> > +                io-channels =3D <&cpcap_adc 2>, <&cpcap_adc 7>;
> > +                io-channel-names =3D "vbus", "id";
> > +
> > +                vusb-supply =3D <&avdd_usb>;
> > +            };
> > +
> > +            regulator {
> > +                compatible =3D "motorola,cpcap-regulator";
> > +
> > +                regulators {
> > +                    vdd_cpu: SW1 {
> > +                        regulator-name =3D "vdd_cpu";
> > +                        regulator-min-microvolt =3D <750000>;
> > +                        regulator-max-microvolt =3D <1125000>;
> > +                        regulator-enable-ramp-delay =3D <1500>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_core: SW2 {
> > +                        regulator-name =3D "vdd_core";
> > +                        regulator-min-microvolt =3D <950000>;
> > +                        regulator-max-microvolt =3D <1300000>;
> > +                        regulator-enable-ramp-delay =3D <1500>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_1v8_vio: SW3 {
> > +                        regulator-name =3D "vdd_1v8_vio";
> > +                        regulator-min-microvolt =3D <1800000>;
> > +                        regulator-max-microvolt =3D <1800000>;
> > +                        regulator-enable-ramp-delay =3D <0>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_aon: SW4 {
> > +                        regulator-name =3D "vdd_aon";
> > +                        regulator-min-microvolt =3D <950000>;
> > +                        regulator-max-microvolt =3D <1300000>;
> > +                        regulator-enable-ramp-delay =3D <1500>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_led: SW5 {
> > +                        regulator-name =3D "vdd_led";
> > +                        regulator-min-microvolt =3D <5050000>;
> > +                        regulator-max-microvolt =3D <5050000>;
> > +                        regulator-enable-ramp-delay =3D <1500>;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_hvio: VHVIO {
> > +                        regulator-name =3D "vdd_hvio";
> > +                        regulator-min-microvolt =3D <2775000>;
> > +                        regulator-max-microvolt =3D <2775000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                    };
> > +
> > +                    vcore_emmc: VSDIO {
> > +                        regulator-name =3D "vcore_emmc";
> > +                        regulator-min-microvolt =3D <1500000>;
> > +                        regulator-max-microvolt =3D <3000000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    avdd_dsi_csi: VCSI {
> > +                        regulator-name =3D "avdd_dsi_csi";
> > +                        regulator-min-microvolt =3D <1200000>;
> > +                        regulator-max-microvolt =3D <1200000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    avdd_3v3_periph: VWLAN2 {
> > +                        regulator-name =3D "avdd_3v3_periph";
> > +                        regulator-min-microvolt =3D <2775000>;
> > +                        regulator-max-microvolt =3D <3300000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vddio_usd: VSIMCARD {
> > +                        regulator-name =3D "vddio_usd";
> > +                        regulator-min-microvolt =3D <1800000>;
> > +                        regulator-max-microvolt =3D <2900000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_haptic: VVIB {
> > +                        regulator-name =3D "vdd_haptic";
> > +                        regulator-min-microvolt =3D <1300000>;
> > +                        regulator-max-microvolt =3D <3000000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                    };
> > +
> > +                    avdd_usb: VUSB {
> > +                        regulator-name =3D "avdd_usb";
> > +                        regulator-min-microvolt =3D <3300000>;
> > +                        regulator-max-microvolt =3D <3300000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +
> > +                    vdd_audio: VAUDIO {
> > +                        regulator-name =3D "vdd_audio";
> > +                        regulator-min-microvolt =3D <2775000>;
> > +                        regulator-max-microvolt =3D <2775000>;
> > +                        regulator-enable-ramp-delay =3D <1000>;
> > +                        regulator-always-on;
> > +                        regulator-boot-on;
> > +                    };
> > +                };
> > +            };
> > +
> > +            cpcap_rtc: rtc {
> > +                compatible =3D "motorola,cpcap-rtc";
> > +
> > +                interrupt-parent =3D <&cpcap>;
> > +                interrupts =3D <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b=
/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> > deleted file mode 100644
> > index 18c3fc26ca93..000000000000
> > --- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> > +++ /dev/null
> > @@ -1,78 +0,0 @@
> > -Motorola CPCAP PMIC device tree binding
> > -
> > -Required properties:
> > -- compatible         : One or both of "motorola,cpcap" or "ste,6556002=
"
> > -- reg                        : SPI chip select
> > -- interrupts         : The interrupt line the device is connected to
> > -- interrupt-controller       : Marks the device node as an interrupt c=
ontroller
> > -- #interrupt-cells   : The number of cells to describe an IRQ, should =
be 2
> > -- #address-cells     : Child device offset number of cells, should be =
1
> > -- #size-cells                : Child device size number of cells, shou=
ld be 0
> > -- spi-max-frequency  : Typically set to 3000000
> > -- spi-cs-high                : SPI chip select direction
> > -
> > -Optional subnodes:
> > -
> > -The sub-functions of CPCAP get their own node with their own compatibl=
e values,
> > -which are described in the following files:
> > -
> > -- Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
> > -- Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
> > -- Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> > -- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> > -- Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > -- Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
> > -- Documentation/devicetree/bindings/leds/leds-cpcap.txt
> > -- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
> > -
> > -The only exception is the audio codec. Instead of a compatible value i=
ts
> > -node must be named "audio-codec".
> > -
> > -Required properties for the audio-codec subnode:
> > -
> > -- #sound-dai-cells =3D <1>;
> > -- interrupts         : should contain jack detection interrupts, with =
headset
> > -                       detect interrupt matching "hs" and microphone b=
ias 2
> > -                       detect interrupt matching "mb2" in interrupt-na=
mes.
> > -- interrupt-names    : Contains "hs", "mb2"
> > -
> > -The audio-codec provides two DAIs. The first one is connected to the
> > -Stereo HiFi DAC and the second one is connected to the Voice DAC.
> > -
> > -Example:
> > -
> > -&mcspi1 {
> > -     cpcap: pmic@0 {
> > -             compatible =3D "motorola,cpcap", "ste,6556002";
> > -             reg =3D <0>;      /* cs0 */
> > -             interrupt-parent =3D <&gpio1>;
> > -             interrupts =3D <7 IRQ_TYPE_EDGE_RISING>;
> > -             interrupt-controller;
> > -             #interrupt-cells =3D <2>;
> > -             #address-cells =3D <1>;
> > -             #size-cells =3D <0>;
> > -             spi-max-frequency =3D <3000000>;
> > -             spi-cs-high;
> > -
> > -             audio-codec {
> > -                     #sound-dai-cells =3D <1>;
> > -                     interrupts-extended =3D <&cpcap 9 0>, <&cpcap 10 =
0>;
> > -                     interrupt-names =3D "hs", "mb2";
> > -
> > -                     /* HiFi */
> > -                     port@0 {
> > -                             endpoint {
> > -                                     remote-endpoint =3D <&cpu_dai1>;
> > -                             };
> > -                     };
> > -
> > -                     /* Voice */
> > -                     port@1 {
> > -                             endpoint {
> > -                                     remote-endpoint =3D <&cpu_dai2>;
> > -                             };
> > -                     };
> > -             };
> > -     };
> > -};
> > -
> > --
> > 2.51.0
> >

