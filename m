Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70966111BA
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 04:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfEBCxS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 22:53:18 -0400
Received: from mail.nic.cz ([217.31.204.67]:44297 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbfEBCxS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 May 2019 22:53:18 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id 708FB635A6;
        Thu,  2 May 2019 04:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556765596; bh=G08ULQPf3N7rUxThDVsyoN45CmUw78EguSZFKbtwrCs=;
        h=Date:From:To;
        b=SyPQOJyxfuBu1jDPZunrXzyB2mymKe1A1mzaLUamvAaYo8SqGuIEyKoNfV3h4BASE
         mtV7DSCWiEx76quvO5CqDOQrY81iGAtMHMTT9bpZE+R86Le3Bj3QDXrxN4wRMmhcdg
         lfW0vkXw6jtNHyPT4rDt8KEalWAHS4mBkC/o+o4A=
Date:   Thu, 2 May 2019 04:53:16 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH leds-next RFC 1/1] led: triggers: add HW LED triggers
 functionality
Message-ID: <20190502045316.4a5d7b45@nic.cz>
In-Reply-To: <20190502005447.11919-1-marek.behun@nic.cz>
References: <20190502005447.11919-1-marek.behun@nic.cz>
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

Hi,
Please ignore the code for now, just tell me what do you
think about the sysfs API and HW trigger list implementation
as string array for each led_classdev.

Thanks.

Marek
