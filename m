Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1067BEDB90
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDJVe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:21:34 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46608 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfKDJVe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:21:34 -0500
Received: by mail-oi1-f193.google.com with SMTP id b19so4204754oib.13
        for <linux-leds@vger.kernel.org>; Mon, 04 Nov 2019 01:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7BzvCFGFyHem7aNvDILp+YA5kEio7GlXJNf7u1ymYOQ=;
        b=0/myShTiuQ4rArcEWL8wQRtTTKVsb2N3NQXnwQYMfPFcyhRTMJ+0vpsq7Ox2xr39VA
         8Awfq4VwFqUYLI92qKeUN9UC5PMacNHQkAY3l7dNZG1YTRsele9Hidoet2llNrWOLQ12
         9UFYDzesbB56fdWwSOlfYYULjDeyT0GFbeq8tyl9f/93zbi6BanBbX7nCf13V/36sLKg
         XoVSaK5XUbT+hVwZ0YGEOILxL/yUKSo+ttq/bxjtjG8lBrSthpTKYrolEofmCTOrGrlp
         759BLOJ30Grp4iGtIEzNCS7mATs3NjGyCkIPoEqizBGoQhkakbOxsKzk0bgGDICkzyOJ
         qG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7BzvCFGFyHem7aNvDILp+YA5kEio7GlXJNf7u1ymYOQ=;
        b=IWNIddRcATytzGsWI7Zair54YsPSiSu2dPOvosi6ZnGEFS16HCfqr1qR6EcqStxDxY
         FONJQRGuiD4VQZISGOHt/X+tPFA0KV6Hi8sLGIKIo7xHRTNgbD7Yhv1cdU8FjJY1p/LY
         E489I08kenJQClD6fKwjLinLjA11FKCcisGYRLeLX1TROqVzv6UppdVeDY2F+WAP8x5l
         jKinaj4zqPkS3qUKG73Zp0b672mcuY8LVqEUgjhu6EF0XwsleUYo473jB/fr04YnsXDK
         KRTloIdczf8X70zchpYYx2ZxUoWfzbnTcxmlf0omboZUeUWXucm35gMxOlHoZKpVWuOQ
         +DfQ==
X-Gm-Message-State: APjAAAUwQbSST/M8DsY+DQSa7sl00sWDxJaYocOZcVYyixmKpiFlN0wz
        p2EQgru35aSGnRjcaFT1qhdU0WD6h5qPR4px5flMfA==
X-Google-Smtp-Source: APXvYqyQ0vp3yLB+4K20lpmZqH2Zh3Z1GRej9tMUGvHlMZYtobNN2gwGszngK6ROtXBsWD+0NaiVD2cotrXFaCG0vS0=
X-Received: by 2002:a05:6808:498:: with SMTP id z24mr3440549oid.114.1572859293807;
 Mon, 04 Nov 2019 01:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20190930130246.4860-1-brgl@bgdev.pl> <20190930130246.4860-6-brgl@bgdev.pl>
 <20191104090904.GA12355@duo.ucw.cz>
In-Reply-To: <20191104090904.GA12355@duo.ucw.cz>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 10:21:23 +0100
Message-ID: <CAMpxmJWc6G6d5zR9kbGoKckMmGwXHB6o4AbFA56sjcyUZrNXjQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: leds: max77650: convert the binding
 document to yaml
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

pon., 4 lis 2019 o 10:09 Pavel Machek <pavel@ucw.cz> napisa=C5=82(a):
>
> Hi!
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Convert the binding document for max77650 LED module to yaml.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>

Hi Pavel,

thanks for the Ack, but a much modified version of this is already in
Rob's branch.

Bart

> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
