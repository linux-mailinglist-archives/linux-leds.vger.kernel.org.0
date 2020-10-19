Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6FD292622
	for <lists+linux-leds@lfdr.de>; Mon, 19 Oct 2020 12:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgJSK66 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 06:58:58 -0400
Received: from mail.nic.cz ([217.31.204.67]:42118 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgJSK66 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Oct 2020 06:58:58 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 7D33D13FFC2;
        Mon, 19 Oct 2020 12:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1603105136; bh=FLr+kjAv6yLD8bqjEwLyprnEfz/mXe2f1830qS+iF0A=;
        h=Date:From:To;
        b=mBLaCSEteSW/F3f9hFbWoHi9mMcq3c8B9laIMisAPFqFlKgUaMZHFpd7Lt2fHlmtp
         /2EVm7TlcXNofS8NSGd90jxiIY415NdHZJ5HedyfjjmzDjxKC3hMK85A6DN0O9fVoe
         NO2hOCjWn268C+tu3IzYLK7nTNervKHXUQDVtsP0=
Date:   Mon, 19 Oct 2020 12:58:56 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Udo van den Heuvel <udovdh@xs4all.nl>
Cc:     Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201019125856.02cebbee@dellmb.labs.office.nic.cz>
In-Reply-To: <d8e450ef-cde9-b799-88e9-8ed9940b95fe@xs4all.nl>
References: <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
        <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
        <s5hblh5mele.wl-tiwai@suse.de>
        <s5ha6wpmei5.wl-tiwai@suse.de>
        <20201014075853.GB29881@amd>
        <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
        <20201014081116.GC29881@amd>
        <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
        <20201014082752.GA31728@amd>
        <9cf705b9-1fca-2445-43de-916b13b9103f@xs4all.nl>
        <20201014083758.GB31728@amd>
        <d8e450ef-cde9-b799-88e9-8ed9940b95fe@xs4all.nl>
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

On Mon, 19 Oct 2020 10:35:12 +0200
Udo van den Heuvel <udovdh@xs4all.nl> wrote:

> People,
> 
> At https://www.kernel.org/doc/html/latest/leds/leds-class.html we can
> read that the LEDS code supposedly optimizes away when certain
> conditions are met.
> Especially the Realtek HDA driver *unconditionally* (as found in
> 5.9.1) *wants* to enable LED functionality.
> I.e.: if this blockade is lifted in the source tree then I can live
> with the 'is optimized out' predictions, assuming that gcc (from
> Fedora 32) can do this.
> So the request is clear; we're almost there.
> Please make it so that the compiler can do the 'optimize away' work
> bij changing a tad in the Realtek HDA driver, along the lines of the
> patch sent to me earlier or something even more beautiful.
> 
> Thanks in advance and kind regards,
> Udo

Udo,

The documentation says that LED trigger code optimises away, not LED
core.

But yes, something similar could maybe be done for the whole LED
class... (maybe!)

BTW, you are welcome to propose a patch as well, since it seems that
nobody else is interested as much as you are in this :)

Marek
