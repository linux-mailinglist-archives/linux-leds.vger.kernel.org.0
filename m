Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82AACDCC1
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 10:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfJGICC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 04:02:02 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43357 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGICC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Oct 2019 04:02:02 -0400
Received: by mail-ot1-f67.google.com with SMTP id o44so10172711ota.10;
        Mon, 07 Oct 2019 01:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WiJjEh2P/dyMb1MJzsWFaEgMTfnFgUH+HoqfUj6XAKA=;
        b=eltyb27puKV6cRWxqPkFxhTgfivvdftkv1x+0jwrQXOjmQFwFlAf/+DQCSRTL4bqhG
         3ejuS7CrKclCons3kSC+F9whC/FoYnmq68huoi6oGwiPF7bkcyMDIdfBHDmrj4pi92et
         jrh6SxHg8AQUQqsELmZmjSXduu/VVO6Q+asGr7WcXcKIcaT9HW3KBZdPio+Aacm3drmQ
         GBTugQi0JVOdYhBzWCi0/lc1F9obdHz4FbBBTicNhBC1axhgKvGQXCBp8URklsjD0h4c
         F2p/2rFVUPM6Ew385+RjHxpAu/lH8BrpiC6hZtPHcLa5bX87476fQZzyT47wYXMKEqfR
         MrsA==
X-Gm-Message-State: APjAAAXpx/7WYiJuLMqOxG3PILNKQCePoxdJwDjaYJFcuFwoQHGnA0qz
        9CP+SBSZiJQN6hD953smcZN3WvXvgQv/ZRBy5Fw=
X-Google-Smtp-Source: APXvYqyr5gTwqlNjWjpoY+fbY/HbAeUc/RMYmX3o91M1ZyhhDDrBuaEKqKaRa2ZbH9RuuHNx4tCPjpqyo1z+igJCvu0=
X-Received: by 2002:a9d:6642:: with SMTP id q2mr19938204otm.250.1570435319780;
 Mon, 07 Oct 2019 01:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191004214334.149976-1-swboyd@chromium.org> <20191004214334.149976-2-swboyd@chromium.org>
In-Reply-To: <20191004214334.149976-2-swboyd@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 10:01:46 +0200
Message-ID: <CAMuHMdVD0paDmb7RbpgY1XWJahVOspyHspPQL_-gseZb2Yqwyg@mail.gmail.com>
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 4, 2019 at 11:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
> This driver can use the of_device_get_match_data() API to simplify the
> code. Replace calls to of_match_device() with this newer API under the
> assumption that where it is called will be when we know the device is
> backed by a DT node. This nicely avoids referencing the match table when
> it is undefined with configurations where CONFIG_OF=n.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: <linux-leds@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
