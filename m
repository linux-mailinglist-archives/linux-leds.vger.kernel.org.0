Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89EF1ACED9
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 15:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfIHNLt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 09:11:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfIHNLt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 09:11:49 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADC422081B;
        Sun,  8 Sep 2019 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567948309;
        bh=eLdp0uQKPaA/H2khASulnTF5ispaOiwO0qb3kmUrZaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qo1sb8E0oylnjatDiCSWTPyITvKI17gvv5isFjaLQrGlKlmHTbV+ZvTLqlZX6mtpn
         Xl6f0Ph6OuVYy3KfIF/YRDO5ZGV/zgYmuv+55/VN73xyOXS7u6NJ7RtqnOtJhZ/mtn
         zxQlcuLBaAa7uGxDOe03LRKh6DI7x2JIyAlqnE5o=
Date:   Sun, 8 Sep 2019 14:11:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 3/5] driver core: class: add function to create
 /sys/class/<class>/foo directory
Message-ID: <20190908131146.GE9466@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 09:41:10PM +0900, Akinobu Mita wrote:
> This adds a new function class_kobject_create_and_add() that creates a
> directory in the /sys/class/<class>.
> 
> This function is required to create the /sys/class/leds/triggers directory
> that contains all available LED triggers.

I don't see a patch in this series that does that, is it 4/5?  I never
got that one...

thanks,

greg k-h
