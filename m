Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08705278B06
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 16:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgIYOg5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 10:36:57 -0400
Received: from lists.nic.cz ([217.31.204.67]:45444 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728888AbgIYOg5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 10:36:57 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 396021405CD;
        Fri, 25 Sep 2020 16:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1601044616; bh=RPjj02PN7wPdQL0DWK37K5WgyYWkBRmPge9TVweysEQ=;
        h=Date:From:To;
        b=v1x92o6zR+rVTebXAfiTmP6+9wTf0MuxAeZvk0waqnDrrac49/HASiBP1wHWej8f+
         dw7pG7z5sFP21cKP7yah3zX7A7HG/7TY0e5tUuh6t/yYvPSX7IQXqP+ve6y4uibALy
         etoEOKLQtblCv5j0GCVoCJ/z+rShmWuvGXcMZgXE=
Date:   Fri, 25 Sep 2020 16:36:55 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds + devicetree 13/13] leds: tca6507: use struct
 led_init_data when registering
Message-ID: <20200925163655.2353800d@nic.cz>
In-Reply-To: <48197a65-a17f-8e5e-98a7-633db1e1b791@gmail.com>
References: <20200919221548.29984-1-marek.behun@nic.cz>
        <20200919221548.29984-14-marek.behun@nic.cz>
        <48197a65-a17f-8e5e-98a7-633db1e1b791@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 25 Sep 2020 08:49:43 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> For all drivers you switch to using *ext() API DT bindings should be
> updated as well to let people know that they can now use 'function'
> and 'color' properties.
> 

I will look into this, thanks.
Marek
