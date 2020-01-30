Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5ECE14D869
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2020 10:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgA3Jxk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 Jan 2020 04:53:40 -0500
Received: from mail.nic.cz ([217.31.204.67]:40364 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgA3Jxj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 30 Jan 2020 04:53:39 -0500
X-Greylist: delayed 553 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jan 2020 04:53:39 EST
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 866DA140D1C;
        Thu, 30 Jan 2020 10:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1580377465; bh=fjaQmaFRrIEmELOFsZ4GLx6mDaplkDUYisiwIYEbxEU=;
        h=Date:From:To;
        b=mVHuCEy7Z3WPET2A+Qeqw1YWr7mhKdEzlaCMdo6xNJ4VGtmjH1aocPYFqRmrlJAod
         VmWpfVJpPEL6+kJgJq2/MVav+5gs9kSlbm8bu1U6wBcrYSKl2Vm02rjkO0X77m9gYf
         sjX5C2dpwj9d9/vWcQsj2my3bYZyH7gFNZyt5+NE=
Date:   Thu, 30 Jan 2020 10:44:24 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: How to synchronize leds in trigger
Message-ID: <20200130104424.22cec119@nic.cz>
In-Reply-To: <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
        <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
        <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 30 Jan 2020 09:57:08 +0200
Oleh Kravchenko <oleg@kaa.org.ua> wrote:

> I'm happy to invest my time to implement such functionality.
> I think it can be really useful for LEDs array like CR0014114 <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5&id=b9dd69155371ebd7055c182e30423edc9104239f>.
> 
> In few days I can publish my vision,
> but before that could you please explain why it will took months?
> Where it can be hard to implement?
> 

Just look at how long the API for RGB LEDs is being agreed upon. It is
over a year already, if not longer, and still not merged.

> > What prevents you from solving this problem in userspace?  
> 
> User-space don't fast enough to provide correct timings.
> 

Can you provide a video or something where we can see?
