Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017498BD4D
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 17:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbfHMPho (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 11:37:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36522 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728535AbfHMPho (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 11:37:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so51442192pgm.3;
        Tue, 13 Aug 2019 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BKzlr/8ZEUpY8BBXQWePFJGE1otrxYkP+Vuhs/bO5lk=;
        b=NanX2O0WwgW2LdKOSmPZ1jf49xIfcawK8Rp0k01YwxB538jOwooXLq0K46gaaSPC+/
         4ZQ2asX7n8uLEaBWBBas7ZrCy7/9qP7W48MTZK6+yp09Poss2MZqj4rlhxjzwMCJc4Pu
         pB3gTMwZWlPU5zfate1SRiUBziFbW0IFTUJcYlix6Or77e9B2U9MdWcj3k/kXy/voL9b
         Hyfw1Uzh8RrGdhUuZqSEnhmDNlUobZujp1JDuUN/8e5J3TLxmDzNMfatkdW+j4aGZZUU
         4+bjLs3aYvWRqMedzkDtBx/+CSUS4A8QIZd5o5FSRjLrS+vtUBUDMg9830Dw1Zm5aUNc
         N7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BKzlr/8ZEUpY8BBXQWePFJGE1otrxYkP+Vuhs/bO5lk=;
        b=OyXe8W/84Auy2HghBiwvZOpIv6RDDF8f7ZA3zN8n+AQlKZ1kySCdq7Hba1KhjX18Yd
         TVQ2w+junJnkWQMQ/8P60FKcmHYSHE0i6zOQ87hu7Mvb3arh8TFYY2HAspb3wzhbduIA
         +X2a/CpCOB6qkKAl5Eiz2ETjNgILrUp4Oziu7XqGkQMnHlektUOz8DJ5OKf06D3xaJc9
         gs6rIysMrbFRlgN5AXq92P/h/cnEGjnAtHbQguz4otrClj2asaCaYvl8pXfv9SqhKVXD
         zIuMlHlSDglzpA4mMXbBhk2cnfey1MXy05+6is3NSr8qat50REU7g8vU4O4HKkI0zLdx
         EoZA==
X-Gm-Message-State: APjAAAUbwCAfBKvvAbCCcywRpt/d74VEEgNEF6Y+S2bUWsXGBQWymD4B
        8n1ysynvjTB23aBBzkjkyYbXsU9Y7xwwmzoR4tg=
X-Google-Smtp-Source: APXvYqw70FiuYzR/lI2fYZGp64z2lcEN9nuBmA0Z8Xffe3srfFfnqXy3pR38nE0v32vUhEGt5uzfln1w4UYeJKJEpYw=
X-Received: by 2002:aa7:8007:: with SMTP id j7mr41268115pfi.154.1565710663815;
 Tue, 13 Aug 2019 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
 <1565459703-30513-6-git-send-email-akinobu.mita@gmail.com> <e1ece602-b413-b391-c7c3-34a8e46254c4@gmail.com>
In-Reply-To: <e1ece602-b413-b391-c7c3-34a8e46254c4@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 14 Aug 2019 00:37:32 +0900
Message-ID: <CAC5umyjjdi8QCw+Bi8hy+F6b9g0o8sqot9eWistW81yaBjAtDw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ledtrig-blk: add interface to stop and restart
 polling disk stats
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B48=E6=9C=8813=E6=97=A5(=E7=81=AB) 4:31 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> I don't see any vital reason to keep this change separately.
> We're introducing new trigger, so please just squash it with
> the patch 4/6.

OK.  I'll take care of renaming led to led_trig in the patch 3/6, too.
