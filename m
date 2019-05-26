Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1B92AB75
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 19:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfEZRhr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 13:37:47 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53895 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfEZRhr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 13:37:47 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BF479802BE; Sun, 26 May 2019 19:37:35 +0200 (CEST)
Date:   Sun, 26 May 2019 19:37:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     hughd@google.com, linux-leds@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: leds: avoid flush_work in atomic context
Message-ID: <20190526173700.GD1282@xo-6d-61-c0.localdomain>
References: <20190526073854.GA13681@amd>
 <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Thank you for the patch.
> 
> I've applied it however I'm not sure if it is an official
> submission, since it doesn't look like (no [PATCH] tag
> in the subject).

It was official submission :-).

> Beside that 'Fixes' tag is somewhat incomplete - it should be
> generated using following git command:
> 
> git log -1 0db37915d912 --format='Fixes: %h ("%s")'
> 
> Fixed that and applied to the for-next branch and will push
> it upstream after a bit of testing for rc3 or rc4.

Ok. Note that this did not crash Hugh's machine but it may crash
someone else's, and probably crashed mine already.

So... it makes sense to push it to Linus "soon".

Thanks,
								Pavel
