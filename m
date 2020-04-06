Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C5F19F73C
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgDFNxl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 09:53:41 -0400
Received: from lists.nic.cz ([217.31.204.67]:59394 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbgDFNxl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Apr 2020 09:53:41 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id B715314138B;
        Mon,  6 Apr 2020 15:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1586181218; bh=UeqJJJiFMTg0tpjmMOH7YdRpeO1X/AOws16dUfgFRqg=;
        h=Date:From:To;
        b=MntAUMz7u82HvKKkDjAVq5GoXNcIuNgPmGtWxqhgHLL7ZoOVJfkuvSLUiMaKIrECM
         BwNqvJsGV31KVoCB23bmmvWfpQJK9vCki/aNDfrRS/ZGP7JbeZyjezwm58/1jQkGPr
         uUW4uq82mUGpRmYkgEcSSZxdSXzvDYrWFZ4+Po3Q=
Date:   Mon, 6 Apr 2020 15:53:38 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200406155338.4aff9fed@nic.cz>
In-Reply-To: <20200406083423.GA31120@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153444.GE8386@duo.ucw.cz>
        <661959c3-cd24-1125-be35-f293212f4fe4@gmail.com>
        <20200321215030.08b75ccc@nic.cz>
        <e6f20e72-0bfc-5fc1-839e-1283d8f15394@gmail.com>
        <20200406083423.GA31120@duo.ucw.cz>
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

On Mon, 6 Apr 2020 10:34:23 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Yes please.
> 
> > Anyway, "omnia" alone doesn't allow to tell the location of the
> > LED either.  
> 
> ACK.

Pavel, what about the other thread (starting with message ID 
<20200402162950.5c2847be@nic.cz>, sent at 04/02/2020 16:29) ?

Marek
