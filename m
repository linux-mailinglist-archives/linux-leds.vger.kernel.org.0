Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D196118E484
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 21:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgCUUow (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 16:44:52 -0400
Received: from lists.nic.cz ([217.31.204.67]:47340 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgCUUow (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 16:44:52 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 77B911431A0;
        Sat, 21 Mar 2020 21:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584823490; bh=HchH2kOUuqIIPLGTJXda0/kWOWMKymuoFlHjkoLXDAI=;
        h=Date:From:To;
        b=lQWIk/KrEApHYirwsYpYn2z5DHif/Jg9vlNqeDhV7IL+ePpWejqcbxBEOElUWMEea
         088/P0wMrBD6/GrdiSnH+E/6d8q5DGc6/0LZWc0SDzLR79Nw83ycE1gL7Z1vjEhhwu
         /ecmFWEpcSshUtkUMlaaumvIHQcME6rQb+ZnvjzA=
Date:   Sat, 21 Mar 2020 21:44:49 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200321214449.0564a524@nic.cz>
In-Reply-To: <0279d61f-6366-02cf-3d65-93d76e52de93@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <0279d61f-6366-02cf-3d65-93d76e52de93@gmail.com>
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

On Sat, 21 Mar 2020 19:55:15 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> What is the rationale behind setting all LEDs to max_brighntess
> on driver removal?
> 

For each RGB LED the microcontroller has ON/OFF setting, and color
setting. When in HW triggering mode, the HW triggering manipulates the
ON/OFF setting and the LED blinks with the color set by the color
setting.

If I did not set color to white before driver removal, then the HW
triggering would blink the LEDs with the color they had set by the
user. That could be [0,0,0], so the LEDs wouldn't blink at all.

So on driver removal the LEDs are set into state in which they are after
reset.
