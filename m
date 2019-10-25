Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC76E5433
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 21:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfJYTSg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Oct 2019 15:18:36 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41877 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfJYTSf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 15:18:35 -0400
Received: by mail-oi1-f194.google.com with SMTP id g81so2321786oib.8
        for <linux-leds@vger.kernel.org>; Fri, 25 Oct 2019 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caqZS73ujV6Zdyymag8M26Wcqn5G2+KweE+j+HquELA=;
        b=b4EDArznp02keGtvfHllt+4DNwPB/wY2U4iXZgPoBpUBy8JsPeH4Qmg4aCBwc6NoZI
         ROfGAR3pXNQolhTlvEZNPiHhNH2bsdtOAfFz3jSVdFsDyUAJnt1KcP//X/ufZs+uHGQR
         mUz7uQkpYvQ7dgGjREk0laFRoO9N3Z+3on59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caqZS73ujV6Zdyymag8M26Wcqn5G2+KweE+j+HquELA=;
        b=bmDE1dMoS4LU/6Vb+lMcQkWCnJYiEuIzGs+KcOkd8AsP65PAnt47cqgk4vBc8qk4t3
         DCVv7Fyd4mvseFDG/ezJkd0M3QkBS8pzCKzirymMupw5m7mhb3+dXDebMT0GDGxDDdjM
         8FMcNp760lcnGlLCvtcQa7hQ3LVD8GDzvbyI3kq4iAZEY4p1lN4yecUyJzeG+gPIx8he
         QOSpZPEavvZXR+BboMuK+zRXB/f/EDjAWSaM13yNgwew5N2C2Ig9Qw4cn5qe8yHlvk9u
         s/r9Af7TOc081Q0HYwYMBzd9NGYgH7TZD/kzawwMr+dH7d8V9BXyGOIKI6isxYmkFXhO
         8guA==
X-Gm-Message-State: APjAAAV9ZE3jrQv2kimG9tlVRMsW/nNM8MBJsFln3CezK2jrGRViUos2
        dWrxZRBEPzaTZ/1OSr/nen4OkTWhh9A=
X-Google-Smtp-Source: APXvYqzrCJMIRgUJOEzVKGe57CC+r/+1qKFXRo1sFCQJdQgjBe4ZXyN31bgy7CBUaFQCcUe3ctkKlQ==
X-Received: by 2002:aca:5015:: with SMTP id e21mr4552761oib.174.1572031112907;
        Fri, 25 Oct 2019 12:18:32 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id z14sm790954oic.13.2019.10.25.12.18.31
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2019 12:18:31 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 41so2766412oti.12
        for <linux-leds@vger.kernel.org>; Fri, 25 Oct 2019 12:18:31 -0700 (PDT)
X-Received: by 2002:a05:6830:1147:: with SMTP id x7mr330026otq.349.1572031110654;
 Fri, 25 Oct 2019 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191024222805.183642-1-ncrews@chromium.org> <20191025173319.GA1768@chromium.org>
In-Reply-To: <20191025173319.GA1768@chromium.org>
From:   Nick Crews <ncrews@chromium.org>
Date:   Fri, 25 Oct 2019 13:18:18 -0600
X-Gmail-Original-Message-ID: <CAHX4x87jLHxZwvaU6nAX5VKy=LZutiRohE6rGd1GffJg-Pt0JA@mail.gmail.com>
Message-ID: <CAHX4x87jLHxZwvaU6nAX5VKy=LZutiRohE6rGd1GffJg-Pt0JA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] platform/chrome: wilco_ec: Add keyboard backlight
 LED support
To:     Daniel Campello <campello@chromium.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Duncan Laurie <dlaurie@chromium.org>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Dmitry Torokhov <dtor@google.com>,
        Simon Glass <sjg@chromium.org>, groeck@chromium.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 25, 2019 at 11:33 AM Daniel Campello <campello@chromium.org> wrote:
>
> LGTM.
> Reviewed-by: Daniel Campello <campello@chromium.

FYI I realized some of the imports in keyboard_leds.c are
unneeded, so I sent a v8 version that fixes this. I presume
you would LGTM that one too though.
