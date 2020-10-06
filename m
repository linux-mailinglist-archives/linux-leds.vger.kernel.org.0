Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCFB284E2A
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 16:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJFOlI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 10:41:08 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:49126 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbgJFOlH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 10:41:07 -0400
Received: from in-6.websupport.sk (unknown [10.10.2.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id B178DCDC33;
        Tue,  6 Oct 2020 16:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1601995263;
        bh=HVuRcObe/WcynJYb+0SjRL2iu5zit4FnU3qAmOrgHFI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=IkuGIUXQMQSq+dWFkTjOTIEuxEecQsZ/C5BiaadYYZ71gmDlrAIYiyoc5+E3xl+al
         QdGrrIONUN5zCNzU+XWBUWeEnqbDxTn/0x9x0zWY5HkNTxkdLm3hr2mxdeYEO5XZC+
         USbuDeYk/R/YcSH+HPGJhMssAlzRukKaEsUeO+OA=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-6.websupport.sk (Postfix) with ESMTPSA id 4C5KsC2VCSz12Mc4;
        Tue,  6 Oct 2020 16:41:03 +0200 (CEST)
Date:   Tue, 6 Oct 2020 16:41:01 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <ultracoolguy@tutanota.com>, Pavel <pavel@ucw.cz>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201006164101.2c3fa0d7@blackhole.sk>
In-Reply-To: <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
References: <20201005141334.36d9441a@blackhole.sk>
        <MIt2NiS--3-2@tutanota.com>
        <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
        <MItBqjy--3-2@tutanota.com>
        <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
        <MItOR9Z--3-2@tutanota.com>
        <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
        <MItjEho--3-2@tutanota.com>
        <20201005173227.GA6431@duo.ucw.cz>
        <20201006093356.6d25b280@blackhole.sk>
        <MIxm3uX--3-2@tutanota.com>
        <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4C5KsC2VCSz12Mc4
Authentication-Results: in-6.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-5
X-Out-Spamd-Result: default: False [-1.60 / 24.00];
         ARC_NA(0.00)[];
         GENERIC_REPUTATION(0.00)[-0.58211997437997];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_SEVEN(0.00)[7];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         SUSPICIOUS_RECIPS(1.50)[]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Adding Rob to Cc, Rob, could we have your opinion on this? Mine is below.

On Tue, 6 Oct 2020 07:21:14 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> >> By the way I just realized that the DT binding in this driver seems
> >> incorrect to me.
> >>
> >> The controller logically supports 3 LED strings, each having
> >> configurable control bank.  
> 
> There are two control banks. You can connect the HVLED outputs to either 
> control bank A or B there is no individual control of the LED strings.
> 
> 
> >> But the DT binding supports 2 DT nodes, one for each control bank
> >> (identified by the `reg` property) and then `led-sources` says which
> >> string should be controlled by given bank.
> >>
> >> But taking in mind that DT should describe how devices are connected to
> >> each other, I think the child nodes in the binding should instead
> >> describe the 3 supported LED strings...  
> 
> The outputs in this case are virtual outputs which are the banks (A and B).
> 
> Since the device is bank controlled the actual current sinks are not 
> defined thus making the the banks the actual outputs.
> 
> This is why the 'reg' property defines the control bank either A or B 
> and the led-sources indicates the strings associated with the control bank.
> 
> Dan
> 

Dan, I looked at the datasheet, I understand this.

Nonetheless, device tree should describe how devices are connected to
each other. The chip has 3 pins for 3 LED strings.

If this controller should be able to support 3 LED strings via 3
outputs, the device tree binding nodes should, in my opinion, describe
each pin connected string. The nodes should maybe even be called
'led-string@N' where N is from [0, 1, 2].

The fact that the device is bank controlled and there are only two
banks (and it is configurable by which bank each LED string is
controlled) is more relevant to the driver, not as much to device tree
binding.

But yes, I do realize that if we had 3 child nodes, and the driver
created 3 LEDs, then changing brithrness on one of the 3 LEDs would
change brightness on at least another one, which we do not want.

Maybe this driver could parse these 3 `led-string` nodes, each having
defined bank via `led-sources`, and then register LED classdevs for
each bank that is mentioned. This way the device tree would be more
correct, IMO, and the driver would not have the problem mentioned in
the paragraph above.

Marek
