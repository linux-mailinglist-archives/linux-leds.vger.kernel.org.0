Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAE516032E
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 11:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfGEJhv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 5 Jul 2019 05:37:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46069 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfGEJhv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 05:37:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 37263805FA; Fri,  5 Jul 2019 11:37:37 +0200 (CEST)
Date:   Fri, 5 Jul 2019 11:37:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Brian Dodge <bdodge09@gmail.com>
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
Message-ID: <20190705093742.gqj3bkipzcuu46q5@devuan>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun 2019-06-30 20:28:15, Brian Dodge wrote:
> The original patch adding this driver and DT bindings improperly
> used "arc" as the vendor-prefix. This adds "arctic" which is the
> proper prefix and retains "arc" to allow existing users of the
> "arc" prefix to update to new kernels. There is at least one
> (Samsung Chromebook Plus)
> 
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

ack.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
