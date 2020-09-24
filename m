Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BC52777F4
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 19:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIXRlV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 13:41:21 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:58874 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbgIXRlV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 24 Sep 2020 13:41:21 -0400
Received: from in-3.websupport.sk (unknown [10.10.2.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id E4B09BD9DE;
        Thu, 24 Sep 2020 19:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1600969278;
        bh=TPLxuAm2FdCjyJjBsSciJ5qAUzr8oveQOo8XtxD9SAo=;
        h=Date:From:To:Cc:Subject;
        b=WbcZTdQ5HySd0ZjtvQZ4B75jeMC7RNAKv0ZXOMmQsT9V+sN0hz9bkrBl1epssUF2O
         MV3Cri+Lj4bisxUPvn2025Fv3mMVsdLlSE9NRpe60zuc9IadkmDp3Tuc9sXpQyEq1s
         YRBxlSBVO/fJMjg+NwrfB6W6zls9Oy/T2S51eDeg=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-3.websupport.sk (Postfix) with ESMTPSA id 4By2Qk4HWXz3LxN8;
        Thu, 24 Sep 2020 19:41:18 +0200 (CEST)
Date:   Thu, 24 Sep 2020 19:41:17 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Imre Kaloz <kaloz@openwrt.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-leds@vger.kernel.org
Subject: Armada 385 Linksys: request for test of 2 patches for linux-leds
Message-ID: <20200924194117.674aba86@blackhole.sk>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4By2Qk4HWXz3LxN8
Authentication-Results: in-3.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-6
X-Out-Spamd-Result: default: False [-3.10 / 24.00];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[99.99%]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Imre, Miquel, Gregory,

you are listed as some of the authors of commits for device tree for
armada-385-linksys* devices.

Do you still have access to such a device?

This device should, according to DT, contain a LED pca9635 controller.

I am searching for someone to test some patches I sent to linux-leds
for this driver.

If you are willing, it concers the top two patches of branch
leds-pca963x-for-test of my kernel repository:

https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-pca963x-for-test

Marek
