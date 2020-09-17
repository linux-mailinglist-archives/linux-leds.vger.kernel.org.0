Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9141A26E935
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgIQW7V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:59:21 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:55812 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725886AbgIQW7U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:59:20 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 18:59:19 EDT
Received: from in-2.websupport.sk (unknown [10.10.2.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id D76A4BEED7;
        Fri, 18 Sep 2020 00:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1600383179;
        bh=1bsHg7QEcrqHq2OVpZYecuhWKG10VHToHH+y8lx7CT4=;
        h=Date:From:To:Cc:Subject;
        b=qRgNrW8Y2Zch5lCT2SUYU9tsqc8xbiscGqpTt4V/y2UY+LehphoR/BB8FywlO9cKF
         wsV+nWHbHixJO1n0UVoha8LVvj1NQCglvccjmPWk2P6hf/KEzfbgC4XRQhEGAuw9Q5
         ZDoHKlGRZF2Y9+Cb9EPoD3V75Rl6rjNkKJMISZzU=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-2.websupport.sk (Postfix) with ESMTPSA id 4Bssgb3RJ8z40X2M;
        Fri, 18 Sep 2020 00:52:59 +0200 (CEST)
Date:   Fri, 18 Sep 2020 00:52:58 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: question about Network Space v2 LED driver
Message-ID: <20200918005258.44c0bfc6@blackhole.sk>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4Bssgb3RJ8z40X2M
Authentication-Results: in-2.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-5
X-Out-Spamd-Result: default: False [-3.10 / 24.00];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[6];
         FREEMAIL_TO(0.00)[sequanux.org,lacie.com,gmail.com,linaro.org];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[99.99%]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

the leds-ns2 kernel driver has allows 3 modes for a LED:
  OFF, ON and blinking on SATA activity

This third mode is activated via another sysfs file in the LED device
sysfs directory: /sys/class/leds/<LED>/sata.

Since we now support LED private HW triggers, it would be better if
this was rewritten to use this new API.

The question is how many people use this mode and may complain if we
change this sysfs ABI?

Another question is whether the LED supports another HW blinking mode,
or just SATA? How is this wired on the board?

Marek
