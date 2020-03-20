Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E761918D889
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2020 20:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgCTTnL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Mar 2020 15:43:11 -0400
Received: from lists.nic.cz ([217.31.204.67]:48048 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726783AbgCTTnL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 20 Mar 2020 15:43:11 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 3B511143196;
        Fri, 20 Mar 2020 20:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584733389; bh=QZINx6kGkvU4CMARM17tViMoG9NhLcbufVpqriQzpY4=;
        h=Date:From:To;
        b=QjNrkrqRKVM3huXvBJzhPlZgsLeUjrkI2j5g+6UYLSI1zYHgaysSoIFQZ0V6byc7c
         DvaGCXyrW038ZmYhtH3kiWR/sHE6Vt96RdfcZ+FHAVU0stOiOZhnhhy0Y1WXmDDBfS
         /NoFwyHo2RBw0RtjPDt3SzzTCxS4xWOgoB0M0ZBg=
Date:   Fri, 20 Mar 2020 20:43:08 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: HW LED triggers again
Message-ID: <20200320204308.411f8d68@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

I want to open the discussions about HW LED triggers again.
The last time (which was almost a year ago, sorry for that) I proposed
an API which used the same sysfs trigger file as for regular trigger
setting, but the HW triggers were prefixed with "hw:" (and each LED
classdev can have different ones).

You wrote:

> I wonder what will be the gain of having hw triggers incorporated
> into LED trigger mechanism, if they are meant not be generic
> by design? Only the LED class driver exposing a hw trigger
> will know how to set it up, and will define protocol via which
> the settings will be passed from sysfs to the trigger (const char*
> parameter in the hw_trigger_set() op).
> 
> And it has to be that way because hardware triggers are hardware
> specific. LED class driver will have to create trigger specific
> sysfs files regardless of whether they are to be shown on
> trigger avtivation, or will persist for the whole LED class device
> lifetime.
> 
> Maybe I'm missing some vital details from the previous discussions,
> but this is what's come to my mind now, after analyzing the proposed
> design.
> 
> The question is: what problem we solve by exposing non-generic
> hw trigger, whose implementation will be in the driver anyway,
> instead of just bypassing the trigger mechanism and exposing
> the required interface directly?

I would still like to go this way, so my answer to this questions is:
- IMO this is simpler for users and existing scripts
- the idea is that it should no be possible to set a software trigger
  and a hardware trigger at the same time (this would just end up in
  more complications), and introducing special hw_trigger file or
  something could make users think that you can

Marek
