Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 514DC2ABED
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfEZTe6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 15:34:58 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:46094 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfEZTe6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 15:34:58 -0400
Received: by mail-oi1-f173.google.com with SMTP id 203so10462363oid.13
        for <linux-leds@vger.kernel.org>; Sun, 26 May 2019 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=zz6oW0M34IrJmrCEu87CLaQUtguqorOfV3mnBJbhr78=;
        b=lUCoCeqp7QRrLpU8YyRo89Gm0FVHGn0/8ZrO2LMywOjNZRkSpsfPphN+hN/1gDGjuU
         nGyfFV546BSL3L4KR8lcE+Iv2PfHCYhxQWwzedPsi4B+jrFV+PxH1iR855395lcdJ9Bc
         lkJkxxjTGnKcDJwbl8Fvs1iiW5INBIbahypfIo8eLphV/m/3YAFRXbHsQZv+jJtkmCtp
         KFNYC9oKSVwif3kycSGtcfhPDpfjxRDSoDj31m/KY6FB6ZSb1s2vt3QAmM6hcbMHsWSh
         DI+YxjweklVmN20Rh45zJlAiKLVRGnq7FAM9IFGdS4m9nV03m66v0YdYmWXg30BVm/CK
         lU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=zz6oW0M34IrJmrCEu87CLaQUtguqorOfV3mnBJbhr78=;
        b=SKOYjLZ56slAC5PxBxIWnVSm36418w/LOKlCmkvgOuIv4RBhei+KhRovCFOdkUe7EF
         La8rC4OFbOEaUwQDa7Bm1gbNatYcy5/kMpetsleaYp9Fw7zHoDrEOhP1FTFijq9BHue0
         cccAwVHnviVB9ibNiGKTQL/LIco1q+uC1WmnobfFIqwEYUU2KChrVwNS1ak+xL/PvxZG
         5vGECFW3Zv5yST0UfNLW14P5qaHYIgb7jiyW1/WZ2vDBiREt8oHjOtT1KYAEAXJddQRq
         7a0OP8zYCRm5xs6CcW+xWMwL9nyXAQe4VSFB7Bgk6BhdBsSAznAlKtwq/CPjrYl+c+X0
         28PQ==
X-Gm-Message-State: APjAAAU2bhdJ8KFJo2VKnZkP4lsFQ/e4JwmoFYW4E8ToYXHF0iQ5Uz1H
        t5gVunYeAqAWzXpk/Nm+pUoE4A==
X-Google-Smtp-Source: APXvYqwVP3Ws9a+oMaQNYN17Gkbi/3LZ0QAaW+uMG++o/zO7IyEv4aGTRx4EqzsRtcWp6vaTrZnHew==
X-Received: by 2002:aca:f089:: with SMTP id o131mr13449731oih.103.1558899297122;
        Sun, 26 May 2019 12:34:57 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id k99sm3311040otk.12.2019.05.26.12.34.55
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 26 May 2019 12:34:56 -0700 (PDT)
Date:   Sun, 26 May 2019 12:34:54 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Pavel Machek <pavel@ucw.cz>
cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, hughd@google.com,
        linux-leds@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: leds: avoid flush_work in atomic context
In-Reply-To: <20190526173700.GD1282@xo-6d-61-c0.localdomain>
Message-ID: <alpine.LSU.2.11.1905261226040.2004@eggly.anvils>
References: <20190526073854.GA13681@amd> <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com> <20190526173700.GD1282@xo-6d-61-c0.localdomain>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 26 May 2019, Pavel Machek wrote:
> Hi!
> 
> > Thank you for the patch.
> > 
> > I've applied it however I'm not sure if it is an official
> > submission, since it doesn't look like (no [PATCH] tag
> > in the subject).
> 
> It was official submission :-).
> 
> > Beside that 'Fixes' tag is somewhat incomplete - it should be
> > generated using following git command:
> > 
> > git log -1 0db37915d912 --format='Fixes: %h ("%s")'
> > 
> > Fixed that and applied to the for-next branch and will push
> > it upstream after a bit of testing for rc3 or rc4.
> 
> Ok. Note that this did not crash Hugh's machine but it may crash
> someone else's, and probably crashed mine already.

Where "this" is commit 0db37915d912, I hope: right, it did not
actually crash my machine, but the splurge of warning messages
forced me to reboot quickly, and go look for the culprit.

Your fix certainly did not crash my machine either,
but I hope we don't expect your fix to crash someone else's!

> 
> So... it makes sense to push it to Linus "soon".

Agreed.

Hugh
