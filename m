Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BC8CE8D8
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfJGQPc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 12:15:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:59100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbfJGQPc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 7 Oct 2019 12:15:32 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7BCE2173B;
        Mon,  7 Oct 2019 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570464930;
        bh=c5S5cP7zbXe49BRmhXacvHzF7MGKuJdxIqqAZRMyIhI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qKjcPd59Q3r4oAQhmdNT3jUfAgQuGlV43LIyhLlgYTCGrWJXflwGMesh62+b0eERb
         kt2y4GqnwWWulinmXB3T1hLTKrgayW3gOA/79+XsKJR4QuBe/YzRDhgo+dJ/AeXie3
         Z1uM1nOmWkfAGBMqspT9g8/Xd+bISDku+j0xS9bw=
Received: by mail-qk1-f173.google.com with SMTP id 4so13137972qki.6;
        Mon, 07 Oct 2019 09:15:30 -0700 (PDT)
X-Gm-Message-State: APjAAAUgdhyRgbG0o3OGzgve4o0pXDpMCQxEgjXBLbnvCSu+FycoE4kR
        ihWJP6wCavreHOtXUtPUC0De3T1fjCzyl61RWQ==
X-Google-Smtp-Source: APXvYqyMttVp4NzoL2BDMDlTAFC0wl59ea24O6Tt3LAaIXYbjarxKts9Yn3gDhGLEMnxuy668Diq4GmdVs5QafCFS30=
X-Received: by 2002:a05:620a:549:: with SMTP id o9mr24622003qko.223.1570464929688;
 Mon, 07 Oct 2019 09:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com> <20191007124437.20367-5-jjhiblot@ti.com>
In-Reply-To: <20191007124437.20367-5-jjhiblot@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 7 Oct 2019 11:15:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
Message-ID: <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Please send DT bindings to DT list or it's never in my queue. IOW,
send patches to the lists that get_maintainers.pl tells you to.

On Mon, Oct 7, 2019 at 7:45 AM Jean-Jacques Hiblot <jjhiblot@ti.com> wrote:
>
> Add DT binding for led-backlight.
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt

Please make this a DT schema.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..4c7dfbe7f67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of LEDs.
> +It can also be used to describe a backlight device controlled by the output of
> +a LED driver.
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs

'leds' is already used as a node name and mixing is not ideal.

We already have 'flash-leds' in use and with the same definition, so
lets continue that and use 'backlight-leds'.

> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. The levels must be
> +                       in the range accepted by the underlying LED devices.
> +                       This is used to translate a backlight brightness level
> +                       into a LED brightness level. If it is not provided, the
> +                       identity mapping is used.
> +
> +  - default-brightness-level: The default brightness level.

You can just assume these 2 get a common schema at some point. So just
need to define any additional constraints if possible.

Rob
