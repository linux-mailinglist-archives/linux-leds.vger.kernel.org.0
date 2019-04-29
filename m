Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31766EA35
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbfD2SeY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:34:24 -0400
Received: from mail.nic.cz ([217.31.204.67]:48674 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728844AbfD2SeY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 14:34:24 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id 5302C63461;
        Mon, 29 Apr 2019 20:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556562862; bh=aC8GwjDtHyZEfLNyE+PQWVnE0ZSTCX2ifOw97dVTW98=;
        h=Date:From:To;
        b=jArKtnithHxtUFBLOCpizjVWvYOgGp2cy59HreEeCDF+D1m5nRGDahvEYV3z2Ul4O
         pU4gpwOgtm8+E+0Il6cYUZTmb+y/+qaOuCHSNuDEqThd9PIX6fCNUgY38szc2czJqu
         Kf3rcfUu0fcLhf+kpRkLNkftfyh8QLaGzFFv4hm4=
Date:   Mon, 29 Apr 2019 20:34:21 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH leds/for-next v2 1/1] leds: turris_omnia: add I2C and
 MACH_ARMADA_38X dependencies
Message-ID: <20190429203421.199147ec@nic.cz>
In-Reply-To: <20190429182906.13422-1-marek.behun@nic.cz>
References: <20190429182906.13422-1-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Somehow I did not add the MACH_ARMADA_38X in the code, only edited the
commit message. Fixed and sent as v3.
Sorry.
Marek
