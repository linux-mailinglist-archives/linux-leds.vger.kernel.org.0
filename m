Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDB9285EFD
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgJGMVJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 08:21:09 -0400
Received: from mail.nic.cz ([217.31.204.67]:49850 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728192AbgJGMUw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Oct 2020 08:20:52 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 14A2F140A77;
        Wed,  7 Oct 2020 14:20:50 +0200 (CEST)
Date:   Wed, 7 Oct 2020 14:20:49 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Vadim Pasternak <vadimp@nvidia.com>, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201007142049.02d8c3ba@nic.cz>
In-Reply-To: <20201007113105.GE12224@duo.ucw.cz>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>
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

On Wed, 7 Oct 2020 13:31:05 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Tue 2020-10-06 19:58:50, Vadim Pasternak wrote:
> > It could be more than one instance of LED with the same name in the
> > modular systems. For example, "status" or "uid" LED can be located
> > on chassis and on each line card of modular system.
> > In order to avoid conflicts with duplicated names, append platform
> > device Id, which is unquie, to LED name after driver name.
> > Thus, for example, "status" LED on chassis is to be called, like it is
> > called now on non modular systems, on which platform device Id is not
> > specified: "mlxreg:status:green". While for the line cards LEDs it will
> > be called like: "mlxreg48:status:green", "mlxreg66:status:green",
> > etcetera.
> 
> No.
> 
> You really should not have mlxreg: in the LED label. It is useless.
> 
> Make it so that LEDs on main body are ":foo:bar", and LEDs on the
> expansion card has something reasonable as the device part.
> 
> Best regards,
> 								Pavel

Moreover the LED core, if there are more LEDs with same color and
function, constructs labels in the form
  [device:]color:function-functionenumerator
so if we want your driver to align with other LED drivers, you should put
the enumerator at the end of the label
  green:status-48
  green:status-66
...

Pavel, the LED core does not put the ':' symbol at the beginning if
there is no devicename. The LED name is only "color:function". Should
this change?

Marek
