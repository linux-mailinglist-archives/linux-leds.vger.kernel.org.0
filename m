Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00AC22020F
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 03:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgGOByO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Jul 2020 21:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbgGOByO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jul 2020 21:54:14 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B432EC061755;
        Tue, 14 Jul 2020 18:54:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f5so717036ljj.10;
        Tue, 14 Jul 2020 18:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WtLhaS2/MYqghS/tBUOjQfwmTd/BXa8nIjD1SlrYAgA=;
        b=a255Yq4RIXuuTC7c+TfIBn8lld+kUEb646LXBXy2N47l/oPxjIFYD1T9vUkCDE39P0
         Swj6+VuefRq4oxhSkQaTLag5Hk9R17FCVoTukPcVPR3Jjr459xH9chlAPAqC+nrIYQxe
         RIPxk7CG9v5AMQMD/g62rSUdHrQiYni+pcZnSfPbHSPzGAB6wdEPo1+bvjSF+NpoHbcN
         Dchqys2zlUnI9BVwHeLYd+XOYL0+PHhGHYHH74XAuGEhVl4RITjiGoPlRY/PXzgWPpHZ
         QqcIRr6iWbVyvwXwOTVN1gbFKUF0Z05IaDRzRl7ZX2G0bhn6x+8a8xPw6a5tA0fRPCjY
         ueQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WtLhaS2/MYqghS/tBUOjQfwmTd/BXa8nIjD1SlrYAgA=;
        b=QbJ3J/471QMBnmrz99mBD2l95v9jXQD5p8+18Wko4J3cG94HvZ9CPehLTY4mDVmaRo
         s9mHtD15TMjWQSzrNTPSlQPlW0O/9hK1O6On1ceXzUC3WHXBGgrQlif+kiwhIljFv8VM
         xLpZdE5E2zy3Ai4oxtBq9doj51uNq+3Eyi5x0qKmfyd/HWb/pvexQavK9uQSBV8Mt2Rs
         6HtcLR5UHsWMsWf+mwVjnelrO2FODmBXflMFjQ2X0k3ixGYwKxBUd1mqZY7G04LLp77R
         5XxwauhLvH4V1qXeac2AJNqPknKoMXPiDBCBSRQk0KlHzB7SxHxxppSTwNe1sYpBBwVL
         DSFw==
X-Gm-Message-State: AOAM5329ZVSl8jimmoExzUCl/xWRhWu7zsm+3LZaUVWs7fg0ErwZfwz6
        VxACbB1zl2pcnc9HAFYawbS3CQbb0kcLLmwnXso=
X-Google-Smtp-Source: ABdhPJzLc+wvn9POm8kWklXHdLC5iQJ+u+6tFnO9vhKrJfQhcHgkJviGKTkHCk1Y3OQAjpV/aBEMJQE1WBJp/ldFIKA=
X-Received: by 2002:a2e:9a0f:: with SMTP id o15mr3714334lji.450.1594778052069;
 Tue, 14 Jul 2020 18:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200713134114.137265-1-gnurou@gmail.com> <20200714223344.GA20740@amd>
In-Reply-To: <20200714223344.GA20740@amd>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Wed, 15 Jul 2020 10:54:00 +0900
Message-ID: <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
Subject: Re: [PATCH] leds: add NCT6795D driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Wed, Jul 15, 2020 at 7:33 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Add support for the LED feature of the NCT6795D chip found on some
> > motherboards, notably MSI ones. The LEDs are typically used using a
> > RGB connector so this driver creates one LED device for each color
> > component.
>
> Ok, let me take a look. What entries does it present in /sys?

Right now these 3 directories in /sys/class/leds:

nct6795d:blue:
nct6795d:green:
nct6795d:red:

with the usual suspects `brightness` and `max_brightness` in each. I
am not 100% sure I got the names right so please let me know if that
is not correct.

>
> We'll want you to switch to multicolor framework.

Most definitely. Last time I checked it was not merged yet though?

>
> > Also add self as maintainer.
>
> That will need to be separate patch, I'd be asking for trouble if I
> took that.

Note that I am also comfortable if you prefer to take care of this,
just didn't want to look like I was throwing this code at you without
following up on its maintenance.

Cheers,
Alex.
