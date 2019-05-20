Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94D237DD
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731658AbfETNOW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 09:14:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387633AbfETNOR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 09:14:17 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEFB3217D7;
        Mon, 20 May 2019 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558358056;
        bh=ArhYqFidQbDseOeh6RGnVwM2C9x89IIUj6IxarCU9Xo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lvQIveQUQlHl8qUCg4Mt9xmQCilab7e4NlHCUz729LxcZ3xS7QcfrjYUGVOGctIGN
         1cBCrrX9hkEuEJfzgMjmKGHA3hdCC+IJdBvOr5ZOKEpvpOrQBfBHcSKD3F6hY0wJe8
         Cw2arMGuA2eiaYQG/5C6YjlESDKbTMQQaDaiCYXs=
Received: by mail-qt1-f182.google.com with SMTP id t1so16135581qtc.12;
        Mon, 20 May 2019 06:14:16 -0700 (PDT)
X-Gm-Message-State: APjAAAUDS9e+FeEG8AdeLh6Vdz6CoENmJzSuerkEJFeyCVaZoBLsx/3/
        FTYqX/xsUiXM4dOp9qPqT0GCOW6y4v8Pdilphw==
X-Google-Smtp-Source: APXvYqxS8HQm36uvnppBXzxLCzjnnzulxIHDgL8ac9/Ttgr/OjP7pC28xyb4pOndJeMh7bl1mZwE0tcaXjAw+ocCAzE=
X-Received: by 2002:ac8:3884:: with SMTP id f4mr64856728qtc.300.1558358055837;
 Mon, 20 May 2019 06:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190520085846.22320-1-masneyb@onstation.org>
In-Reply-To: <20190520085846.22320-1-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 20 May 2019 08:14:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
Message-ID: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
To:     Brian Masney <masneyb@onstation.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 20, 2019 at 3:59 AM Brian Masney <masneyb@onstation.org> wrote:
>
> The '#address-cells' and '#size-cells' properties were not defined in
> the lm3630a bindings and would cause the following error when
> attempting to validate the examples against the schema:
>
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> '#address-cells', '#size-cells' do not match any of the regexes:
> '^led@[01]$', 'pinctrl-[0-9]+'
>
> Correct this by adding those two properties.
>
> While we're here, move the ti,linear-mapping-mode property to the
> led@[01] child nodes to correct the following validation error:
>
> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
> led@0: 'ti,linear-mapping-mode' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>
> Fixes: 32fcb75c66a0 ("dt-bindings: backlight: Add lm3630a bindings")
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> ---
>  .../leds/backlight/lm3630a-backlight.yaml     | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
