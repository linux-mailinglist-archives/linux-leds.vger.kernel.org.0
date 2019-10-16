Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37422D8F5E
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 13:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732462AbfJPLZ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 07:25:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35868 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389378AbfJPLZ6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 07:25:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so23605704ljj.3
        for <linux-leds@vger.kernel.org>; Wed, 16 Oct 2019 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LFk6sNVy6XuWO8svgO6+SSQcv4B4DXcQwZI92acaUZg=;
        b=wlgzQ3oAP2ptN6X3utRzkAkjiqbEvYZXZQ+934tvjKy32thr8vZSqIc3pjPQLtXgfH
         jeUBx5S+U2BSXgq2bY3a6rZHCVzdzh+kGvbE07If8ZiWQLa2h2+10RU4koLv03ux3gjE
         DCzgydf/q4oYSBTGeXWDkZTjJjNQfG0kl/C1baQNK4RkmkkBDVuU8EPk3rS1S21Ok64P
         Pjs+a+EA94Nyt6KVp1f5UHI6dOEEB26gXM8gWR7Sv++h4vM+Y5KkwFnMR/zr6gAyKTgc
         h01AoRKaUw8x7ixZkwD232rQIiApexPE1UixgnWHen2AVtsKl7yBpql2TxBthHjwEaYS
         6gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LFk6sNVy6XuWO8svgO6+SSQcv4B4DXcQwZI92acaUZg=;
        b=ZCAk/VF0eAqyBN5z0vYeKTwRUlpVimDvWDbfaDIkUiyJHY8DjO0wqr/CS+dH5lVav0
         JaFjw6cjPBv9b38ng3sH0lqjXBulX6WUxAuAP5bvernT6x7llgj1psthUUN2zc+MXB1i
         A0P3SbPkP6LzCcKFGsKLKA2uhqJQfa77Z+VvBmpfpLTmKJNQ9s7xtRIeeVK1CNzNqT/l
         njnMd5spEjWSEX3hu794osu+saYf8RPUbB5PU3/Ly0gl2xrDxBh4yX9xDWM5PPnQgz2/
         FgR8/tVTkHTTuxF0J2El2jmHl131SWMlkmfeju/0nuYbDzxuY0lzIkZPk53q/MBAOU6m
         Umiw==
X-Gm-Message-State: APjAAAXs+iDe3/K2U6fT/kNxq50GDdY/7ICO7fYdkCrd04AmCkfnzndm
        BPTjBqJaowkkslJ3T5Llq8uKsQVTjDtW+G19lfcF6w==
X-Google-Smtp-Source: APXvYqwSxhfGwr8JdpJK0AeAGHl2j1JLtgGa4YJbf2sWoCxuxnBaFU4sl8NjUq/icemc6j6BY/vNAsSpnZssdNul8CE=
X-Received: by 2002:a2e:481a:: with SMTP id v26mr18130946lja.41.1571225156108;
 Wed, 16 Oct 2019 04:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191008204800.19870-1-dmurphy@ti.com> <20191008204800.19870-9-dmurphy@ti.com>
In-Reply-To: <20191008204800.19870-9-dmurphy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:25:43 +0200
Message-ID: <CACRpkdZQmgO-VMVMQz9P5S-Ff5JWBZ+CzN-TS+cwqMSmBargHg@mail.gmail.com>
Subject: Re: [PATCH v11 08/16] dt: bindings: lp55xx: Update binding for
 Multicolor Framework
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 8, 2019 at 10:48 PM Dan Murphy <dmurphy@ti.com> wrote:

> Update the DT binding to include the properties to use the
> multicolor framework for the devices that use the LP55xx
> framework.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Tony Lindgren <tony@atomide.com>
> CC: "Beno=C3=AEt Cousson" <bcousson@baylibre.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
