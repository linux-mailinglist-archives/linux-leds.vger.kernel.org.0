Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DC829F410
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 19:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgJ2S0E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 14:26:04 -0400
Received: from mail.nic.cz ([217.31.204.67]:35660 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgJ2S0E (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 14:26:04 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 5947B140835;
        Thu, 29 Oct 2020 19:26:02 +0100 (CET)
Date:   Thu, 29 Oct 2020 19:25:55 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Yu Kuai <yukuai3@huawei.com>, linus.walleij@linaro.org,
        j.anaszewski@samsung.com, simon.guinot@sequanux.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] leds: various: add missing put_device() call in
 netxbig_leds_get_of_pdata()
Message-ID: <20201029192555.36834608@nic.cz>
In-Reply-To: <20201029174952.GB26053@duo.ucw.cz>
References: <20201029092305.900767-1-yukuai3@huawei.com>
        <20201029174952.GB26053@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 29 Oct 2020 18:49:52 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> 
> Thanks, applied.
> 
> But it seems to me similar handling is needed in "success" paths, no?
> 
> Best regards,
> 								Pavel

Pavel, the subject of this commit is wrong.
It should begin with
  leds: netxbig:
instead of
  leds: various:
since the patch does not touch various drivers, only one: netxbig.

Marek
