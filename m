Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 108A0D1DB6
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 02:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJJAw0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 20:52:26 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:35198 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731134AbfJJAw0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 20:52:26 -0400
IronPort-SDR: KP+TDw3abl/DSqy7bmalkCp0mt64Afpyaw8ueA2wPxhT6asjKAH659E0IXy3tFvNh1n1LkhDML
 lyjCF3K8b5DlliavePxjFag9ZQAViMYS+iisgvUmUszaTXqZ5N/pVUrKf+7BS230BjsLZ1RkZQ
 I6iDhCCAcugLP/0dXP2vyfpBRvh4mRBBOpEFSOOulSeETSys8RlR4ih3EBELR1LNUV5zy6ytwe
 Qzbj/NLTEDvWB4/dG53T1dHaZabVUV6JWyeo4vTw1ZCbFztUyh9CtW6MLbZLib3H/CqBsz3i/S
 LBc=
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Oct 2019 17:52:25 -0700
IronPort-SDR: 5L4sJ8Sf+cQwvwIsNeq9CncPt18G8SLD744ne+mRaFs2tNiU2kCQj/srsThOrW9NROl7I65kIR
 eAqStAfEM9yay1jiJjwUoi98r2CcPvFHeojZwQJY3WeyKG3CB6oTlVFUrk76jeMPahcDczFrx9
 F2JqFOR45KbcVbn/TNW5nZ/R2IfCp/H2Uo68JBFDIQ3Wjb6URqdWgFe10v5o/ldy5ORWU93v54
 e3rSPU60ZBiUTH0v2Q9Rkmnk36ZNi9NjwZ0P91fikYUOqF6GQ+sCD6vlazxkIvLyyWMbRe2bEu
 B3An10YkRKmlEkvSSQXMXyNM
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 09 Oct 2019 17:52:24 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id C16E74714; Wed,  9 Oct 2019 17:52:24 -0700 (PDT)
Date:   Wed, 9 Oct 2019 17:52:24 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20191010005224.GA31702@codeaurora.org>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
 <20190810071322.GA13760@amd>
 <20190930133902.GA2249614@kroah.com>
 <20190930172239.GA26107@amd>
 <20190930172743.GA2409822@kroah.com>
 <20191004200932.GA28140@codeaurora.org>
 <20191008074731.GB633@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008074731.GB633@amd>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 08, 2019 at 09:47:31AM +0200, Pavel Machek wrote:
> Hi!
> 
> > > > > I don't understand.  The original commit broke userspace operations.
> > > > > Shouldn't it be reverted, or fixed this way in order to have userspace
> > > > > work properly again?
> > > > 
> > > > So, what it is exactly that is not working? :-). Yes, root can
> > > > disconnect LED from v4l2 interface; he can also connect it
> > > > back. Documentation says that happens.
> > > > 
> > > > Yes, root can do stupid things.
> > > > 
> > > > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 is from 2008. I'd
> > > > prefer we did not apply it in 2008, but...
> > > 
> > > Ah, my fault, I thought this was a new commit.
> > > 
> > > Guru, what are you doing here that this is required all of a sudden?  No
> > > other kernel seems to need these changes, what is different in your
> > > Android userspace that requires this patch series?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Hi Greg,
> > 
> > Our camera flash driver first requests the available current from the
> > flash LED before setting its brightness. It passes a trigger as argument
> > to the function that determines the available current. This function
> > uses trigger_to_lcdev() to look up the led_classdev associated with that
> > trigger as a first step. This lookup will fail if the trigger has been
> > dissociated from its led_classdev as a result of a user setting that
> > led_classdev's brightness to zero manually through sysfs. 
> > 
> > Why would the user set the brightness to zero? The user does this as
> > part of camera and LED testing activities which include, amongst other
> > things, visual inspection of the operation of various onboard LEDs. The
> > user uses sysfs to manually turn on and off the LEDs by setting their
> > brightness to max and then to zero in order to verify that they are
> > working as expected.
> 
> Yes, so you should really set trigger to none before changing
> brightness manually and restore it back to whatever it was when you
> are done with manual testing.

Hi Pavel,

Tried your suggestion to set the trigger to "none" before manual testing
and to restore it afterwards, and it works.

Thanks a lot.
