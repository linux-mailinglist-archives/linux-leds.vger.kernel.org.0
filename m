Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DB927CEED
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 15:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgI2NTM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 09:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgI2NTL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 09:19:11 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3B6C061755
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:19:10 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b22so5431408lfs.13
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=huQkybx6xgiq5ep9b9Z6Jtj2GnVGOT0GbWv7KTvCyh8=;
        b=xdYI4ibCan97ChhlfM77mX6NFjK5wHySjOI734naaiHZNaRwIi6Pq8xtR8g+J1mhEv
         EDb1DOuwvB32vuQNC7Ix3C8S9GArvfsUasL5XHGub8169Sqhdkd/AldTls2hIki8/0fR
         OFCBf3+ERSpOT/Bl7xQ80b0geLc8dDJ4UNZzAKRovbPuk3wBsIDC198OpBMwub+z9nrp
         UDGTjraNCCtDBLsIVKa6iBZCX8ajkMkmZYtAT9Fjqqlk3YB7YYlaF/uNrKbyQJxkza2p
         Avj6YAnFlpxzQETkB4wX9nG502vVOkHSVL5mNkkT/hmhBoZgxJkJ4+LywDPbe4pS3JWi
         f6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=huQkybx6xgiq5ep9b9Z6Jtj2GnVGOT0GbWv7KTvCyh8=;
        b=V+RUENIhA7tllRz/7/ROgVsQ1IQE7UB4295MpiT3/31H4tdjFCm1MP4Gih3EDUtx/w
         oADdrm/6VbIs587pZaP7t72QtIJFoeD+Ey41zEg6T+GdqViwcDyngTeKcWjwWQxcY408
         2c6W2FL8DVy5XJVdL+OklYMI0VNbsI8m6llj6PyPDw73SQJ2vsNkzD9ySLJHT6ygRHyn
         m8P6nk7llMFmTMoBhmMX6FIHgPwUmaLctWbljUZvpIT+J3CwpFCFEzu+Xqlkes19QM4o
         zllgRGPUOTkAecboyWxJ5BEioopus9xC9P+8dBnTjsUcXV9R0RD+frzDnJrUnIJoosCg
         matw==
X-Gm-Message-State: AOAM532tB1R4+05OLvlXxlbUkazw4q7wdHc1jygjzZmLv9W1qvBBesWY
        wu8fBtaXKbveQRvdQnUrDYTWTRxlXCDrtwcTpaOeNqc9+USwpw==
X-Google-Smtp-Source: ABdhPJza9HV3omevT/bn+0MI0JUAtnbQxKTJMyk0so8b8tN6xV09ehJkIW9tNM0izhgnFJdXIxfzxbnL7zTrXAGsrLE=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr1121199lfr.571.1601385548910;
 Tue, 29 Sep 2020 06:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200919221548.29984-1-marek.behun@nic.cz> <20200919221548.29984-2-marek.behun@nic.cz>
In-Reply-To: <20200919221548.29984-2-marek.behun@nic.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:18:57 +0200
Message-ID: <CACRpkdbhfJrct+xb4p70cjzQEd9JNLOAbKRopA0H0B-M5xRjqQ@mail.gmail.com>
Subject: Re: [PATCH leds + devicetree 01/13] leds: tca6507: Absorb platform data
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 20, 2020 at 12:15 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrot=
e:

> The only in-tree usage of this driver is via device-tree. No on else
> includes linux/leds-tca6507.h, so absorb the definition of platdata
> structure.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
