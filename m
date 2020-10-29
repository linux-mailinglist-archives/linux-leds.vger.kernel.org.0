Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F5929E662
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 09:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgJ2I1Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 04:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727766AbgJ2I1Y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 04:27:24 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6339320728;
        Thu, 29 Oct 2020 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603951211;
        bh=EHa5BsSfCkh9DS+40ELjTKWR7bfIby87AkF7gtbKwyM=;
        h=Date:From:To:Cc:Subject:From;
        b=nEF7Bhu/SUGWNMR374BWy3InFE7vXM/d6r68rPzZ5dqr44sQp+DzrzPAMaIsBEEeV
         iizLKH7MZXvWa3p4CZ4WcAGowKo6RRiVIGWHhlceCwnVHQx+gk7S6WeA+Q16eNamTr
         QtCNQOyWEssPJkLzV7YOks2VHKSJ8sI+55ebVy00=
Date:   Thu, 29 Oct 2020 07:00:00 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ben Whitten <ben.whitten@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: ledtrig netdev: what is the purpose of spinlock usage?
Message-ID: <20201029070000.15472666@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Ben (or Pavel or whomever can explain this),

since you are the original author of netdev LED trigger, I guess this
question should go to you. Why are spinlocks used as locks in the
netdev trigger code? Is this for performance? Would it be a drastic
performance hit to use mutexes?

The reason why I am asking is that I am designing an API for transparent
HW offload of LED triggers. (Some LEDs, eg. LEDs on ethernet PHYs, can
blink on rx/tx activity themselves).

You can find this at
https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-trigger-hw-offload

The current approach for the netdev trigger is that the
set_baseline_state function calls trigger_offload() method of the LED
classdev. But the whole set_baseline_state function is called from
within spinlock, and so when the trigger_offload method calls something
that can sleep (MDIO bus communication, for example), kernel complains:
  BUG: scheduling while atomic

Thanks.

Marek
