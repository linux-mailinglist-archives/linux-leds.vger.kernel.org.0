Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D34164F3D
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 20:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgBSTvG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 14:51:06 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43014 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSTvG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 14:51:06 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so489878plq.10;
        Wed, 19 Feb 2020 11:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M4zKKP2Q/R2OqgXmQC7JNNxIqu37zs1Y9dnrMmNhKok=;
        b=kYk0BubJtysEMvnnNMFVM2IeGCr/Ru/1kfwbbHPBOBzi4yZrxwxByDP6WsdcN/Vx+O
         L+WCpjbRy+2EKKAygOeHsRw/f6pdNP/RIvO3BeCvi+bP2TjPUZ7+GeMXjAvXQlICZoy/
         OevfqzKOx6/eAovyMtu7G/oDqXc2UWTZb1mlsBNgTlTfPOM8udclGqbaVeXqeR6KhAyC
         m8M5f5wPFgloka5Xu0Qop9wSSZtctnLXyxEFZXECtLslg9qYcj8dJuY2ghZZc+Fc2ay5
         kChYlnafdEFyX0ptn61peDksV2Xh+QgWDN+z0XWbhmcfmbDJ+Eglc+yfSLJZxj4wa+nK
         prNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M4zKKP2Q/R2OqgXmQC7JNNxIqu37zs1Y9dnrMmNhKok=;
        b=ow4Juqku5Xss4S8WiM/Jp5zg98FmJ/POirhNGYsjMeU81HvawVZcbcJr6lqzftV9qH
         k0V7xuEuh/gB1vpFul8YDe0nDGRznjPCXDVxKoFgoUL1yURyLljnNI2kTdkmts6oZW2m
         LdBlM1JD5GWGOpUIWAjbsC93Y/wRRXVngmvhLtIl/QU5XReDeHtuPl+u9Gk2arASKW+3
         py81aPg1yoNjeh60S0MKlHgOVquBuJWB6kjcqqcNjlH1E9jYYGyjNg2QV7b+fKbpMXP4
         F59bxJU7efbRWWvYcLFYzOGxLCZ0n4ktwWDswpqZtgX5EMAWBgoK2jRWzhXRoHGsp8Fg
         9RJg==
X-Gm-Message-State: APjAAAUaC6eZ1qn/p1lFhuFzjP6TfmyFR2ezF9ezsoF07hmpMmOUBAwZ
        xWJQhCPVgJxRrmUqO4n5MTol9c7aUUHxq1vT5Hg=
X-Google-Smtp-Source: APXvYqzWKZoMXWkNrbnA1iDHd6g69T2x4VPoAwG/SDYVlx1df4kBzSZPdGZCwUj1t8upq1pqlBurbpQO9aN3F7v2m8U=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr11000285pjq.132.1582141865462;
 Wed, 19 Feb 2020 11:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20200213091600.554-1-uwe@kleine-koenig.org> <20200213091600.554-2-uwe@kleine-koenig.org>
In-Reply-To: <20200213091600.554-2-uwe@kleine-koenig.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Feb 2020 21:50:54 +0200
Message-ID: <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:
>
> This function is in the same spirit as the other kstrto* functions and
> uses the same calling convention. It expects the input string to be in
> the format %u:%u and implements stricter parsing than sscanf as it
> returns an error on trailing data (other than the usual \n).

Can we first split the kstrotox* (and simple_strto*) to the separate
header first?

On top of that, why kstrtodev_t is so important? How many users are
already in the kernel to get an advantage out of it?
What to do with all other possible variants ("%d:%d", "%dx%d" and its
%u variant, etc)?

Why simple_strto*() can't be used?

>  #include <linux/export.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>

> +#include <linux/kdev_t.h>

Perhaps preserve order? (It's for the future, since I doubt we will
get this in upstream anyway).

--=20
With Best Regards,
Andy Shevchenko
