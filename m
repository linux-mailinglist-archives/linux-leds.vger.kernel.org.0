Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E477270376
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 19:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgIRRnS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 13:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRRnS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Sep 2020 13:43:18 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1255BC0613CE
        for <linux-leds@vger.kernel.org>; Fri, 18 Sep 2020 10:43:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 4421B140A76;
        Fri, 18 Sep 2020 19:43:16 +0200 (CEST)
Date:   Fri, 18 Sep 2020 19:43:15 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: Re: question about Network Space v2 LED driver
Message-ID: <20200918194315.61fd8f43@nic.cz>
In-Reply-To: <20200918134201.GF29951@kw.sim.vm.gnt>
References: <20200918005258.44c0bfc6@blackhole.sk>
        <20200918134201.GF29951@kw.sim.vm.gnt>
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

On Fri, 18 Sep 2020 15:42:01 +0200
Simon Guinot <simon.guinot@sequanux.org> wrote:

> On Fri, Sep 18, 2020 at 12:52:58AM +0200, Marek Behun wrote:
> > Hi,  
> 
> Hi Marek,
> 
> > 
> > the leds-ns2 kernel driver has allows 3 modes for a LED:
> >   OFF, ON and blinking on SATA activity
> > 
> > This third mode is activated via another sysfs file in the LED device
> > sysfs directory: /sys/class/leds/<LED>/sata.
> > 
> > Since we now support LED private HW triggers, it would be better if
> > this was rewritten to use this new API.  
> 
> It sounds like a great idea.
> 
> > 
> > The question is how many people use this mode and may complain if we
> > change this sysfs ABI?  
> 
> Not a lot IMHO. This LED devices are found in some LaCie/Seagate NAS.
> Most of them, such as the Seagate NAS 4-Bay (Marvell Armada 370 SoC)
> are supported by the Debian distribution. For the users I have been in
> contact with, I am pretty confident they should be able to deal with
> this changes. They already dealt with worse.
> 
> Another user is the Seagate NAS distribution. And this user will be
> happy to switch to the new ABI.
> 
> > 
> > Another question is whether the LED supports another HW blinking mode,
> > or just SATA? How is this wired on the board?  
> 
> Three different LED modes are available: off, on and SATA activity
> blinking. The LED modes are controlled through two GPIOs (command and
> slow): each combination of values for the command/slow GPIOs corresponds
> to a LED mode.
> 
> For an example, have a look at the leds-ns2 DT node in the
> armada-370-seagate-nas-4bay.dts file.
> 
> The only hardware blinking mechanism for this LED device is SATA.
> Basically the SATA blinking signal is built from the SATA pin activity
> of the HDD. This signal is a little bit reworked by some electronic
> components in order to produce a blinking rate OK for the human eye.
> 
> Hope this helps.
> 
> Simon

I apologize, I accidentaly sent the question from my private e-mail :)

Simon, thanks for the info.

Another question: Is there only one disk on this device?

The reason why I am asking is this:
  We already have disk-activity trigger. I would like to implement a
  generic LED trigger offloading API, so that if user chooses
  disk-activity and the LED can offload that to hardware, it wil.

  But the disk-activity trigger blinks the LED on activity of any
  disk, you can't choose one as in the netdev trigger.
  
  If it is possible to have only one disk on that device (which is
  improbable if there are USB ports) than implementing offloading will
  be trivial.

  If not, than we would need to allow disk-activity trigger to select
  the disk as well. This is probably good anyway.

Are you willing to work on this with me? At least reviewing and testing
patches?

Are you anywhere on IRC or another real-time chat, XMPP for example?

Thanks.

Marek
