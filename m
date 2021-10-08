Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BEF42674D
	for <lists+linux-leds@lfdr.de>; Fri,  8 Oct 2021 12:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbhJHKDV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 8 Oct 2021 06:03:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:54344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239562AbhJHKDP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 8 Oct 2021 06:03:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C98261027;
        Fri,  8 Oct 2021 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633687280;
        bh=Ytq4PQkSijuKbkv6j8ipOla0HKtwwWeiLQ9TknDWZ3w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HRZwV7YrVjH6N+Rki5pemLt1o0zDjj7Ot0u8Pm2Uo8bodpCE+kTJzutj1bb3CORyv
         tRQ/B5jO65vkY0r5IxZS3IMjYCgIEY0GfjlgUoOiUIcPn4ZQDsDpz7sxTO+wPzbank
         CtAgT9XJNKIm82a1Cs+Ig70Q1fIah3Ajx6ca/2r5ckrJqnLyFuarvXJnls8ZjF6/XM
         tzUv1P80DwVFYY77ShgR2Mt6CW9LN/ZGG8PKVau6xSpllT2k6kbZE7hKgmiQCJZsNq
         9wTj9MvPIOT1X5NjtFKLO+epP2hx0UlBjIQn5eCvKux7fc+c6xmFOEiPHLn1ZbgbFG
         rJUidhfiH7UPA==
Date:   Fri, 8 Oct 2021 12:01:16 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        hch@infradead.org
Subject: Re: [RESEND PATCH v5 2/2] leds: trigger: Add block device LED
 trigger
Message-ID: <20211008120116.65aec469@thinkpad>
In-Reply-To: <749c46a3-5d02-08ef-2a45-e785d65999c7@gmail.com>
References: <20211004155546.1120869-1-arequipeno@gmail.com>
        <20211004155546.1120869-3-arequipeno@gmail.com>
        <20211005232738.371df6b8@thinkpad>
        <749c46a3-5d02-08ef-2a45-e785d65999c7@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 6 Oct 2021 11:07:06 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> I have feeling that per-LED work items are likely to cause contention
> for the mutex, since they will probably all have the same (default)
> interval and they will usually be set up at about the same time (i.e.
> at system boot).  Instead, I would propose to have a single work item
> that is simply scheduled for the next time work is "needed" and then
> checks all LEDs that are due at that time.

What about creating one work struct for all different interval values?

That way if the user never changes the interval, there will be only one
work struct.

I wonder if this can be done in a sensible (i.e. not overcomplicated
code) way.

Marek
