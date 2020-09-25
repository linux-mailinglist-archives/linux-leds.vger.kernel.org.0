Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34D72794BC
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 01:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgIYX3Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 19:29:16 -0400
Received: from lists.nic.cz ([217.31.204.67]:56638 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgIYX3P (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 19:29:15 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 51E741408AF;
        Sat, 26 Sep 2020 01:29:14 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:29:14 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: omnia: fix leak of device node iterator
Message-ID: <20200926012914.3b40ce13@nic.cz>
In-Reply-To: <20200925231823.GA15759@agrajag.zerfleddert.de>
References: <20200925231823.GA15759@agrajag.zerfleddert.de>
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

Already fixed in Pavel's for-next
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=62aa40d0e907849d740ceba2a7f6bcc88896699f
