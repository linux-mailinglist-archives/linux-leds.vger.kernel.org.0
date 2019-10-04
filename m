Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27D9CC3F3
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 22:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbfJDUJe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 16:09:34 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5642 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730746AbfJDUJd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 16:09:33 -0400
IronPort-SDR: WtWD0dH1xMN+UplfngyNpN/C38lbkJt3erNRrTzIR8EgOh7dPfdwjjGgodLmIJzd1HQZfj3PrF
 QrZ67QEkrWIrQzTyX0hn9OzJDg6duu0DO0f8IfhUJ2WUqS9G+kilBvLLpfghZweYZvD33aC7kt
 lMFAs+faYa9p1odtWoI/YoLcNpVnkyg0rcDuIXTsZmINcmvcvo7tPqMy/GaC+7QmVZN83cp3F6
 AX++zy7duimka8Q2DpjNiQtX5I5EmBuPay7S030O/t6NqgTY68lhjTNFOytRqWlASYrFsONxkx
 /vc=
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Oct 2019 13:09:33 -0700
IronPort-SDR: 9ICUc+DTTiKGzKi7aA/r2a/HESwclO9tdbuGxTkbxe//az0DxpLsnrb3uRQTxUswipVMRy6NbD
 BT9jvXy4HfA/wNg2q+uCs1NkhkC+bhlnfSx4OsAI8fo6RbkxsDnF7QmjYEFx4Eb51vkf5BEVSf
 XqF6Aes6rX9ROK2vQhGCdhRpHZsGej7NCdPACGAdumKIWZBO4hU4yrhOGJ7HaeI/3KutLA0R1D
 MQynlOX0eOur0aPAJwgl1uEnKuEEisnMedjYJ17sv5lvFE81IEkTqYp8OQ1PFOrz3TMTfNqYzA
 z+YjHig81E4eKzeip5QeTBAB
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 04 Oct 2019 13:09:32 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 808BF46E8; Fri,  4 Oct 2019 13:09:32 -0700 (PDT)
Date:   Fri, 4 Oct 2019 13:09:32 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@denx.de>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20191004200932.GA28140@codeaurora.org>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
 <20190810071322.GA13760@amd>
 <20190930133902.GA2249614@kroah.com>
 <20190930172239.GA26107@amd>
 <20190930172743.GA2409822@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930172743.GA2409822@kroah.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 30, 2019 at 07:27:43PM +0200, Greg KH wrote:
> On Mon, Sep 30, 2019 at 07:22:39PM +0200, Pavel Machek wrote:
> > On Mon 2019-09-30 15:39:02, Greg KH wrote:
> > > On Sat, Aug 10, 2019 at 09:13:22AM +0200, Pavel Machek wrote:
> > > > On Fri 2019-08-09 17:52:46, Guru Das Srinagesh wrote:
> > > > > From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> > > > > 
> > > > > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 ("leds: disable triggers
> > > > > on brightness set") removes the trigger on an LED class device when
> > > > > brightness is set to 0. However, there are some LED class devices which
> > > > > need the trigger not to be removed. In a use case like camera flash,
> > > > > camera flash driver passes in a trigger device to LED class driver. If
> > > > > the trigger is removed when the brightness is set to 0, this will affect
> > > > > the clients using those triggers. Hence add a flag to always keep the
> > > > > trigger even when brightness is set to 0.
> > > > 
> > > > No.
> > > > 
> > > > Yes, it would affect those clients. Don't do it, then. It is
> > > > root-only operation.
> > > 
> > > I don't understand.  The original commit broke userspace operations.
> > > Shouldn't it be reverted, or fixed this way in order to have userspace
> > > work properly again?
> > 
> > So, what it is exactly that is not working? :-). Yes, root can
> > disconnect LED from v4l2 interface; he can also connect it
> > back. Documentation says that happens.
> > 
> > Yes, root can do stupid things.
> > 
> > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 is from 2008. I'd
> > prefer we did not apply it in 2008, but...
> 
> Ah, my fault, I thought this was a new commit.
> 
> Guru, what are you doing here that this is required all of a sudden?  No
> other kernel seems to need these changes, what is different in your
> Android userspace that requires this patch series?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Our camera flash driver first requests the available current from the
flash LED before setting its brightness. It passes a trigger as argument
to the function that determines the available current. This function
uses trigger_to_lcdev() to look up the led_classdev associated with that
trigger as a first step. This lookup will fail if the trigger has been
dissociated from its led_classdev as a result of a user setting that
led_classdev's brightness to zero manually through sysfs. 

Why would the user set the brightness to zero? The user does this as
part of camera and LED testing activities which include, amongst other
things, visual inspection of the operation of various onboard LEDs. The
user uses sysfs to manually turn on and off the LEDs by setting their
brightness to max and then to zero in order to verify that they are
working as expected. 

So what happens if the user, having turned off the flash LED after an
inspection, wishes to move on to testing the userspace camera app? The
userspace camera app will not be able to utilize the flash LED for any
of its functions due to the led_classdev lookup failure. The user has no
choice but to reboot the device to continue with his testing.

Therefore, to summarize, this patch is being utilized in our downstream
kernel (for a few years now) to support aforementioned testing
activities, and so we thought it might be a good idea to upstream this
patch now.
