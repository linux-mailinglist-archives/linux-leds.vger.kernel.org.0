Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F223F2854EF
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 01:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFX0E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 19:26:04 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:58362 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725925AbgJFX0E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 19:26:04 -0400
Received: from in-6.websupport.sk (unknown [10.10.2.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 3972BBEEEE;
        Wed,  7 Oct 2020 01:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1602026761;
        bh=RFrqULxzwBErrRfQ+ImfGFDUkuStRN+XO2kbXCNBFZg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=NWzLoXxqt1W3zYmn7v1awO7jqvSP33p5ou7JEYp4AZNl/mQHre1lEqV0l3d9FZhXH
         MLtMjb8gQCW5DOp2Hn1Fm9aOjYg9RQ9pgjHkCfw3hPk0F6JtKQyHPczfoyUwUPSJKL
         nPjYwPpJxAMKk5/2Bu1ftDpxLd44XfpffhjQeQDc=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-6.websupport.sk (Postfix) with ESMTPSA id 4C5YVw6BL1z12MlW;
        Wed,  7 Oct 2020 01:26:00 +0200 (CEST)
Date:   Wed, 7 Oct 2020 01:26:00 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     ultracoolguy@tutanota.com
Cc:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lm3697: Rename struct into more appropiate name
Message-ID: <20201007012600.3b3e7779@blackhole.sk>
In-Reply-To: <MIuPIKy--3-2@tutanota.com>
References: <MIuPIKy--3-2@tutanota.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4C5YVw6BL1z12MlW
Authentication-Results: in-6.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-4
X-Out-Spamd-Result: default: False [-3.10 / 24.00];
         ARC_NA(0.00)[];
         GENERIC_REPUTATION(0.00)[-0.58216030843908];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[5];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 5 Oct 2020 22:17:14 +0200 (CEST)
ultracoolguy@tutanota.com wrote:

> Subject says it all. This rename was briefly discussed in this other patch: https://www.spinics.net/lists/linux-leds/msg16865.html (I don't know another way to link to emails, so I'll just use this archive).
> 
> Feel free to suggest another name for the commit; that was just the better name I could come up with :/ .
> 
> 
> 
> 

Gabriel,

the subject of the patch should be
  leds: lm3697: Rename struct into more appropiate name
("leds: " is prefixed). Look at history
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/leds?h=v5.9-rc8

The commit message should mention why you are renaming the type
(something like "to be semantically more correct, since that structure
represents LED control bank as described by the datasheet").

Also it seems that you are using git format-patch for generating patch
files, but you are sending these patches as regular e-mail attachements.
You should instead use git send-email, as is normally required
for kernel patches (and they would also appear in patchwork
(https://patches.linaro.org/project/linux-leds/list/). Please look at
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
and https://git-send-email.io/.

Marek
