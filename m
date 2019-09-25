Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1683CBE414
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfIYSA2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 14:00:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39837 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfIYSA2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 14:00:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so6619975ljj.6;
        Wed, 25 Sep 2019 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXErfHRA5V2j3IUtubyzRXAx2v534OGMhyigdUPBMkg=;
        b=LK7791fGIcuVhpBiCLk3PBGgYW4+HzNT3JotY3GbmDZnU9bwPlxKQfDVI6CtTb54PS
         /BbkkL/bWQ60N4KacXiZ85US+3S0Mru0wazmMxJ64M6jVhBATVv2Xgi+YNEMf3UCdDZH
         Zu6E8L5g3kpTsDA5qp/WtBPQvAcBA8U1PL19Tkblf891QNHemU2By5XqxNV+3ZwmvptB
         zQdWKnmbtJuU5G6TRxItZ9gTcOVeBZk1XgBvvq2PVPXmh2f5Em8l+ZrNaiH/EdhtM8Vj
         mtbzosw/1a+aE80JLW3IpH/RKrFWI62tXUo3PNZsMxkC8pH7LiW32jPgAfIkM2NSrdeR
         +2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXErfHRA5V2j3IUtubyzRXAx2v534OGMhyigdUPBMkg=;
        b=oFYe28299GZPIMtsZxu+F8NEMXbfMfn8w+n1V5JbtaOFFH4CT/OThXCAMcCesDFNHM
         vk0hH4YUQad7ED/E9YqOou53743K0bsmXTDej/UaD0YXz5RzIPMov0xaXue3HnVmIfut
         ip8zIsjaG5+mAugTo7lOaKRomuyTGVRUZjatOQUgSZJv5QW5/ftS+HAsIieiQ4grkx1u
         EvVnD025tO/A1wydphKCgPZSy7YcM7FzvKLRDsfXLnlrWBk6rwJq4bcQe+wBoC3KglUR
         amJ0Kl2bGSjslihvpZ3PCIqyLQlfjp/EvHqOSzggDD8zFY8JREsbZuoTAMI0XNI0eBYx
         wI0g==
X-Gm-Message-State: APjAAAXWVLx6NTQYyuUzKMCUMFKJOLQ226npIPIKO/BxVXeU3DvB5qra
        AkvpJsvkh9Wl+40ktHzNYwTl9mEdGuSrCF46gw13BYcU
X-Google-Smtp-Source: APXvYqz9QCn5sWNeOv03oMOxgE5+x5J9dl1ayPpJXqo6/K9aKxKAWK2BN4GIo+xjV+DJ6cfijaHL75/TULdR8VvoRFk=
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr2354841ljl.10.1569434425656;
 Wed, 25 Sep 2019 11:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190925174616.3714-1-dmurphy@ti.com> <20190925174616.3714-12-dmurphy@ti.com>
In-Reply-To: <20190925174616.3714-12-dmurphy@ti.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 25 Sep 2019 15:00:34 -0300
Message-ID: <CAOMZO5CeDKohK5np29X1fvzqBiCw6S3QmbpJ7jjn+avObKNqFw@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] ARM: dts: imx6dl-yapp4: Add reg property to the
 lp5562 channel node
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On Wed, Sep 25, 2019 at 2:41 PM Dan Murphy <dmurphy@ti.com> wrote:

>
>                 chan0 {

This should be chan@0

>                         chan-name = "R";
>                         led-cur = /bits/ 8 <0x20>;
>                         max-cur = /bits/ 8 <0x60>;
> +                       reg = <0>;

Passing reg without its corresponding @ entry gives a dtc warning when
building with W=1.
