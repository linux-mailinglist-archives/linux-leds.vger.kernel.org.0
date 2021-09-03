Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D283FFE2B
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 12:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349107AbhICK1t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 06:27:49 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44727 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349093AbhICK1t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 06:27:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2251632009B6;
        Fri,  3 Sep 2021 06:26:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 03 Sep 2021 06:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=KY5OBrR7O6qCgIO4mUzdLTOyVLk
        6WygSVbhx1mrc9fU=; b=pYkrbjqZwyTIRiAnLyL+JOVI2e07OHcqJLdgtB+h+e4
        IfvTwNO1hB4124ILgFfTmu6A7MMG1cu2hU7oa1YhlUrrYgJO3gBP5JOt04z1bk/b
        ldFdNXB8lPTGnFLnYpuPWYdvwx5SOreD3Asu83W6Kc+qJSXndqWAKqynErStlfhC
        +xMaYV9ra3fKTsGP/bGMlq5Cu6IvWmOumxtkXwVKvblgy9FX/KEoHFsjjCxvKbNx
        Uu899kt3hRLOmTp1yjHCDBBcuogVL4sb1qZ+T0J1iJ0NGMBgRS+E2/dXQwdKrlW+
        QdWUOOErCEqZGoECwOdBmsL7laQ2s4XFW7G8eCqjmUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KY5OBr
        R7O6qCgIO4mUzdLTOyVLk6WygSVbhx1mrc9fU=; b=BIseoD80l5Jn4O5A8L3hbl
        muGyaVHFif2EtbMr02yOwt3vkW/dnevn4PfiX29S0LilkUNUbEqnqRj4Ur55Y/qc
        PByuXKYFNS00ix83Vzx7Mz/B6FHQScu4yjG9jRciz4kNPuG7DP/sO14+LCjohDKK
        xWD4i/z4L1Ku5d+2Tccb3T5XBkSj87AU6kmgGESl7euE3BzO8lOsLh9/39Rew3kn
        WfxUSR5Bpii9KqssAsoYy3tDWQnlhqc//XhBaxHl6ivVvvXN1nHRFPgPX2MWP95o
        aGKH7UjJP1+MKm2DyLAf06cweg0FhLvJK0ICIc+5iwEUW00iUu46WWKjWv3xMoMg
        ==
X-ME-Sender: <xms:ZPgxYY2N1Hiq-Fs8J8Jx7V418lcPv34fjm39tKMlasZ0fTowSyFQnw>
    <xme:ZPgxYTEPn3VFIg_0oDXDHUPJhw445n78BQVjvw7CIrwk3h50y6p6ORy5BQU9W19f4
    _QTwdnWBvKfuc3KjnY>
X-ME-Received: <xmr:ZPgxYQ7W63K-96ICQMzIWqGDeeD5L3snjbOZQOMOiugTepKNjGzQGDqmZE8XoTBvZa47sEy9IN3I_iqorWP_bGb4G1N6L0tmRrJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteduffeihfehvdfgueefjeevvdevffffieekuddvjeeugfeiffegtddutdef
    kedtnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpghhithhhuhgsrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZPgxYR0kho51k6x2M9r0-cEYbgROlC_L22Al3NopzD2q_tzyp5KGMg>
    <xmx:ZPgxYbEyj-BnLrGaCeYjMMLdMN7ODmV-J8yHkh_JEokL5HUtfQvr1g>
    <xmx:ZPgxYa83lv6i7As3XLyH-mlb8NomuJs0rCOIUuQSJiXtVkmu3j09NA>
    <xmx:ZfgxYRZelHv5_ok25CvmWoDTbj9Rto74lWEqnQWo8wCm4BAOd7v9ZA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 06:26:44 -0400 (EDT)
Date:   Fri, 3 Sep 2021 12:26:41 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED
 controller
Message-ID: <20210903102641.hujr5g2ewbaurcrs@gilmour>
References: <20210902234228.32223-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dyhlyhwwdbrjfy42"
Content-Disposition: inline
In-Reply-To: <20210902234228.32223-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--dyhlyhwwdbrjfy42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 02, 2021 at 06:42:27PM -0500, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../leds/allwinner,sun50i-r329-ledc.yaml      | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun5=
0i-r329-ledc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329=
-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-l=
edc.yaml
> new file mode 100644
> index 000000000000..bf883944e911
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.y=
aml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/allwinner,sun50i-r329-ledc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner sunxi LED Controller Bindings

sunxi is ambiguous, it implies that it works with every Allwinner SoC,
but actually supports only one. Please mention R329 everywhere you used
sunxi.

> +
> +maintainers:
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description:
> +  The LED controller found in Allwinner sunxi SoCs uses a one-wire serial
> +  interface to drive up to 1024 RGB LEDs.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun50i-r329-ledc
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-ledc
> +          - const: allwinner,sun50i-r329-ledc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: TX DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: tx

You don't need the items: here since you have a single item.

> +  interrupts:
> +    maxItems: 1
> +
> +  vled-supply:
> +    description: Regulator supplying power to external LEDs
> +
> +  format:
> +    description: Pixel format (subpixel transmission order), default is =
"grb"
> +    enum:
> +      - "bgr"
> +      - "brg"
> +      - "gbr"
> +      - "grb"
> +      - "rbg"
> +      - "rgb"
> +
> +  t0h-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Length of high pulse when transmitting a "0" bit

Every property with an -ns suffix is already a uint32 here:

https://github.com/devicetree-org/dt-schema/blob/master/schemas/property-un=
its.yaml#L54

Just make sure you have a single item

Looks good otherwise, thanks

Maxime

> +  t0l-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Length of low pulse when transmitting a "0" bit
> +
> +  t1h-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Length of high pulse when transmitting a "1" bit
> +
> +  t1h-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Length of low pulse when transmitting a "1" bit
> +
> +  treset-ns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Minimum delay between transmission frames
> +
> +patternProperties:
> +  "^multi-led@[0-9a-f]+$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1023
> +        description: Index of the LED in the series (must be contiguous)
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    ledc: led-controller@2008000 {
> +      compatible =3D "allwinner,sun20i-d1-ledc",
> +                   "allwinner,sun50i-r329-ledc";
> +      reg =3D <0x2008000 0x400>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      clocks =3D <&ccu 12>, <&ccu 34>;
> +      clock-names =3D "bus", "mod";
> +      resets =3D <&ccu 12>;
> +      dmas =3D <&dma 42>;
> +      dma-names =3D "tx";
> +      interrupts =3D <36 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      multi-led@0 {
> +        reg =3D <0x0>;
> +        color =3D <LED_COLOR_ID_RGB>;
> +        function =3D LED_FUNCTION_INDICATOR;
> +      };
> +    };
> +
> +...
> --=20
> 2.31.1
>=20

--dyhlyhwwdbrjfy42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTH4YQAKCRDj7w1vZxhR
xRq6AQCaDLpaWTo/QBI4WR95p4GRPO4c/3bPkoKaufwibfgOsAEAmT4sXG4yHkEd
At6eW1Mc87p41Qd/jZKd3IEbQg05wgQ=
=xaQN
-----END PGP SIGNATURE-----

--dyhlyhwwdbrjfy42--
