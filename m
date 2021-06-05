Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAA139C73A
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 12:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFEKEF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Jun 2021 06:04:05 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:45747 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229892AbhFEKEE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Jun 2021 06:04:04 -0400
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jun 2021 06:04:03 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id dc745646-c5e2-11eb-88cb-005056bdf889;
        Sat, 05 Jun 2021 12:46:12 +0300 (EEST)
Date:   Sat, 5 Jun 2021 12:46:11 +0300
From:   andy@surfacebook.localdomain
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] leds: rt8515: Put fwnode in any case during
 ->probe()
Message-ID: <YLtH45iTFAn9QcpQ@surfacebook.localdomain>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
 <20210529111935.3849707-12-andy.shevchenko@gmail.com>
 <CACRpkdb21tMWyoxHuv8CwUB9fZeD332B_ui2jtMP7ocfbi6LSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb21tMWyoxHuv8CwUB9fZeD332B_ui2jtMP7ocfbi6LSQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Tue, Jun 01, 2021 at 12:06:05PM +0200, Linus Walleij kirjoitti:
> On Sat, May 29, 2021 at 1:19 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> 
> > fwnode_get_next_available_child_node() bumps a reference counting of
> > a returned variable. We have to balance it whenever we return to
> > the caller.
> >
> > Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Pavel, can you, please, review this batch? I think I addressed most of your
comments if not all.

-- 
With Best Regards,
Andy Shevchenko


