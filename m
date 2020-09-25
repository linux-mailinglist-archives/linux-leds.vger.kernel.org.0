Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F66278B28
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 16:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIYOqf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 10:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgIYOqf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 10:46:35 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FEAC0613CE
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2020 07:46:35 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id C8863140934;
        Fri, 25 Sep 2020 16:46:32 +0200 (CEST)
Date:   Fri, 25 Sep 2020 16:46:32 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [PATCH] leds: Add documentation about possible subsystem
 improvements
Message-ID: <20200925164632.22bcd5af@nic.cz>
In-Reply-To: <20200925093318.GB20659@amd>
References: <20200925093318.GB20659@amd>
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

On Fri, 25 Sep 2020 11:33:18 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> +* Command line utility to manipulate the LEDs?
> +
> +/sys interface is not really suitable to use by hand, should we have
> +an utility to perform LED control?
> 
> 

I will try to implement ledtool.
