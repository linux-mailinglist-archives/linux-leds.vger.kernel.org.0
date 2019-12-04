Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A9C113854
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2019 00:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfLDXqG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 18:46:06 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44205 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDXqF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 18:46:05 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so931420lfa.11
        for <linux-leds@vger.kernel.org>; Wed, 04 Dec 2019 15:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1oLuXTqP88AIJllnfUv70RaPKExVa3V8VYnwKFzXr90=;
        b=uQsVwqfRLCAJ44cXxreDwyi2t/pF9+6ktyX482qqhirs8nOUetXz3CJa6gX0d+StLI
         4hrMtR2KUPZJw5V9yHYkuSxlHVrR0NcTxV66wok3kLyVEuiOdQ+87ZkDHjo1SaVe3qUt
         ExxMY9tZrB37RkXAXo4+S8vuXV0/TIiZ+XYFCBFZcfDXc3VafGj58nQzO9kGCJoKepaQ
         45rWBnslFVJvwRITTvab0lm9wGC+o0gvis1jyeSwupr14EAS+0r5nhMkr0FKXIXS8wql
         EzUis/tSIFpQC3T4HIAyyWycETuiTV5ec3iLux8doePS9L+H9xv35IDJsOa4ul4uNfwO
         BGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1oLuXTqP88AIJllnfUv70RaPKExVa3V8VYnwKFzXr90=;
        b=LNKEtCPxIJ8a0SJ3NaSFI35/nOFX7aRnLYQaMqBqGoENDhgm+7C1W+vKWpfIAkD0kq
         sV5FI1EfLgBP3rt5KUfQ6btBe4Qq/M1dryLBc5X4Ejcypelr/7frHkDwT9blniV5IcG1
         8gfOTGavJ60jAFHKpBjwwDOZooXu21pYh8zZBsduRCwLtbUwNlLgyzXAC3jf8OTd0/1f
         BIUcsHYp65hW+djBaG9w1FTI1R4m7uljRth2XdvQu0JBbJmImr01pf+I2HDDv/yxtsJe
         IRTlOJjzCsMKmeE+xAWc+xYELzhclmk3vX86FRNsZYiD7h+wrBv8KFRmHgCMEbR8rkDS
         X0jQ==
X-Gm-Message-State: APjAAAULaUmFiCUUL5H0lASCeq3weVmYXMhPalnn9OedTIbnwz1Mznxn
        LaAjp1TVy2GUK4Z2o+3gOwVMjv6SbQ91LM7o5hjBUg==
X-Google-Smtp-Source: APXvYqyqVwBh7QLOCMY5WcVcMFSXciWG0BZOqFwPI5/16XD9DuCX7jpZucNx06M4rxkCfx9c/Kf2nRnArTuT/U4S8QM=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr3552742lfn.44.1575503163840;
 Wed, 04 Dec 2019 15:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20191204110219.GV25745@shell.armlinux.org.uk> <fb88206c-a094-df37-04af-71a1174fb0f6@gmail.com>
In-Reply-To: <fb88206c-a094-df37-04af-71a1174fb0f6@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Dec 2019 00:45:51 +0100
Message-ID: <CACRpkdZzzaaDM_Y8-Zf8AQrmfcVd+i0Uk0vYccnizG73cjEooA@mail.gmail.com>
Subject: Re: "leds: gpio: Use generic support for composing LED names" breaks
 gpio debugfs
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Pavel Machek <pavel@ucw.cz>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Dec 4, 2019 at 9:52 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> It seem that the only proper solution would be introducing a new
> pre_register_cdev(const char *name) op to the LED core, that would allow
> drivers to come up with their implementation thereof. In this particular
> case leds-gpio driver would need to put there gpiod initialization.

I don't know the particulars but if it helps you can at any point
call:
int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);

For any successfully obtained descriptor, to set the consumer name,
i.e. the text appearing in debugfs and the GPIO character device.

Yours,
Linus Walleij
