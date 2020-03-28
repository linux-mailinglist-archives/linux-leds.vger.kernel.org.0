Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F157119681C
	for <lists+linux-leds@lfdr.de>; Sat, 28 Mar 2020 18:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgC1RU2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Mar 2020 13:20:28 -0400
Received: from lists.nic.cz ([217.31.204.67]:32918 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgC1RU2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 28 Mar 2020 13:20:28 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 3D73C140AE8;
        Sat, 28 Mar 2020 18:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1585416026; bh=pIFVTeclzp94nlpM/D+x8E7a/MRd5+P6eklzpRYcAtQ=;
        h=Date:From:To;
        b=qiqWKZu1YmMsdNCPHHnnKQAFIAx5nFMH/bNRxmNL8jibuL63twCkTVlyPzahMvB1f
         +U4kXXM42HquaIcxe5+aNcg7ZjWSU1erdYp/adPOwltXZCsgJx0iAlafzdcvbzju4u
         ZGcTH4h/4AOYIz6HyaWbfXCls97fiXJHiCteLFDc=
Date:   Sat, 28 Mar 2020 18:20:25 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200328182025.0b33200e@nic.cz>
In-Reply-To: <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153325.GD8386@duo.ucw.cz>
        <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
        <20200328132729.5e628fe6@nic.cz>
        <20200328133629.79603fe3@nic.cz>
        <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
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

On Sat, 28 Mar 2020 14:01:47 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> I already proposed adding a "luma" LED class device for similar
> case [0], but didn't here any feedback from Pavel so far.
> 
> [0]
> https://lore.kernel.org/linux-leds/1583502010-16210-1-git-send-email-nbelin@baylibre.com/T/#mf52c8d4f68260a445223c26957c61e6267e0932d
> 

Hi Jacek,

in the case you mentioned there is a one "global" brightness setting per
each RGB LED. On Omnia, all 12 RGB LEDs have just one "global"
brightness property. Ie. I press the button, and all 12 LEDs glow get
dimmer. So there could be a 13th LED device with color LUMA, but what
function should it be given in DTS?

Marek
