Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC6418E4DB
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 22:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgCUVxo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 17:53:44 -0400
Received: from mail.nic.cz ([217.31.204.67]:43052 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgCUVxo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 17:53:44 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 895361431A9;
        Sat, 21 Mar 2020 22:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584827622; bh=xrWbLm8pqBpcCrukx5+5WlnMKdfw7XJ0kSCwn7K4C9g=;
        h=Date:From:To;
        b=JCdN2XpLAz1Qw7JfQETz+Istz8W3tYlCp+qzMu6fmLgr/uQhDcmqYbfDzcbmM3hUy
         H3/WNYm9JKQXo87Qi9/bukHn7SjsC6PPCP1Hr5XL3CkF4+XVVP1oHBuSzAq+MCo+9M
         NvPisukyvs8GRrqBoQUeuGij22I0IrJ5rzzZajmA=
Date:   Sat, 21 Mar 2020 22:53:42 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200321225342.7651547b@nic.cz>
In-Reply-To: <20200319181604.2425-1-marek.behun@nic.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
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

Hmm.

The microcontroller on Turris Omnia supports more settings than just
LEDs (usb3 port power and input button for example).

I am wondering if this approach (registering LED driver to
communicate with the microcontroller) is correct, since the
microcontroller can do other things.

For Turris Mox firmware I created a driver in
drivers/firmware/turris-mox-rwtm.c.

Maybe I should create I driver in drivers/firmware/ for the Omnia
microcontroller, and then the LED driver could use functions exported
by the microcontroller driver to manipulate LEDs.

What do you think?

Marek
