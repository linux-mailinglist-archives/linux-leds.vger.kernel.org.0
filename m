Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44CD36312A
	for <lists+linux-leds@lfdr.de>; Sat, 17 Apr 2021 18:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhDQQ2H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Apr 2021 12:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbhDQQ2G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Apr 2021 12:28:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9851EC061574
        for <linux-leds@vger.kernel.org>; Sat, 17 Apr 2021 09:27:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x20so19158640lfu.6
        for <linux-leds@vger.kernel.org>; Sat, 17 Apr 2021 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=8z6k0nvfMeU4+kk1Rlj4CMcpU7JmVD+ziX5/+jJBhDQ=;
        b=vAElt+sPFwrOhtoJNtxeRaeANyYUC6X6IGW1ahDm55jX7txp0a6HdNd/wYLScMuy6Y
         liHssROsMqFUjfRu3F2ygQEsK59aS0Flby1PsSs6XhGCEaNJnIB/OgYd1KgNJJ5PvMhA
         R9ZA5fmOh7CcCun9EfWrLi9UWllDEaYy8kkPxR/oDGJXLGu+irZK6XIoeXLV+ed95Cr5
         V/3bBvJ5BtIsZG2gZWvRWFQzedkTJEnPb8Sufj5u2Vl0b7an+H04JZp67lNi5KhlY4tu
         L/Lm9dHxe6dZl5ggBnhIJSb3Aa3CiljHUup+idwzkrjjhgY64U2qlliS9M8eWqbm8Q/A
         Ireg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=8z6k0nvfMeU4+kk1Rlj4CMcpU7JmVD+ziX5/+jJBhDQ=;
        b=RFL8ky+KIidbhZ8Kg2WFUs95AgwawGp+5MXkdKqfAWHEdLGtWyTIB3rvQZzcu09DFH
         8ECgmMgJlRGkCm7AVJPqaLw3Mo7KODxDEfsfUCL4EbjU5K9ZwXvpmUszMw42k7VXZCLO
         4iiqpafmxWQZx3XvU91AfldQAQ4lqKX9Pt2OtPHq9PpcaZZTbjLxe12R9MHI/0St07PS
         u2bGCQt5DAs+Si4d/K6MK6ZF6LBANIn2eWfxMMTbdaxcmaI7eTiGMKG/b/TX+oVzCEP0
         B9rTtV1elrzJTJIAMhEKwWMNH4XWAYbeuOy/J+z9TdzWtVklAcXUro6ayJODbMVkYPBD
         8klA==
X-Gm-Message-State: AOAM531JhNh9JyJ5lA8kpOW62Cw/s2x03WDd5+GHas4IkwfmGg7iXGYC
        lf7aXMisYrnuByBA3O6jtgzuw1L6bE2OMAhcQg==
X-Google-Smtp-Source: ABdhPJwXD7us6GrwPF85nM5wDfZ8VPiJxesnCrEJ1KZPYw4Q4KQDokylH7r/C4xSbhIvh0IMRIOTNewWsJQ3RaXU9n0=
X-Received: by 2002:a05:6512:969:: with SMTP id v9mr6634614lft.466.1618676858156;
 Sat, 17 Apr 2021 09:27:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1211:0:0:0:0:0 with HTTP; Sat, 17 Apr 2021 09:27:37
 -0700 (PDT)
Reply-To: moneygramdepromo@gmail.com
In-Reply-To: <CAP2Ytb=kECmNhwhwPxqWQi+6vaOHCe2ZqYFjRSsdpFP1Nq+tbA@mail.gmail.com>
References: <CAP2Ytb=bdyZG1-Gev7Hmd0Ax_cxRnBdxLtkHLQ_xzkRweVherQ@mail.gmail.com>
 <CAP2YtbnJNHYDDUbnnirr=riHhr5x93gmWLa5HOyDSnjHhYoDXQ@mail.gmail.com>
 <CAP2YtbnxTamMdG+P3xYaN69+DVCEWcsLKLTQBn-tWgjCxAUd=Q@mail.gmail.com>
 <CAP2Ytbm_vLn9oYwQ-+bxyQQC_SiPceG9=grTKKtzMNQ-E+Cacw@mail.gmail.com>
 <CAP2Ytb=vTim3NY1Ce1AHWTPgrE9rdwUfpPrn2RACjeiKRVkDDg@mail.gmail.com>
 <CAP2Ytbk1yYBxO-vq5hYFbrOJGYon+yFQoLqyuq1O5YwA2Qgodw@mail.gmail.com>
 <CAP2YtbmAf1T6ZwvWiLJHkXDYuNLsDd8pbZ3YxyeKHzWKXseCyg@mail.gmail.com>
 <CAP2Ytb=fRYKAwrbsYVaO1j0scBieALu8WF_FQfmvk4cPeNTszQ@mail.gmail.com>
 <CAP2Ytb=syLK=0ttNTfbczBHYvEcwc-yqEJMxOjAWBVnX8ajKyw@mail.gmail.com>
 <CAP2YtbmZtQQbiBN3E_Kg1G-ehqQ8F=WpVekVUg2qfSRjAPFL4g@mail.gmail.com>
 <CAP2YtbmF_-cj4PFYDJYVRy6TE3B5sSDsnMXjNXqdo4VHGwGPWg@mail.gmail.com>
 <CAP2Ytbk8uR7JSjSDvukB0f0HEYh4jxfEW99G_4=s_hk5gHYO9g@mail.gmail.com>
 <CAP2YtbnS4PUVGygMsnvm=ayn=rbe8eMcJjooVaf3t5c3RPUUwA@mail.gmail.com>
 <CAP2Ytbkj+1C1wmwX9g7uGESKCMz7HpGr3bDjZj_7DUF=mTawAQ@mail.gmail.com>
 <CAP2YtbmWrpLF+SYDDtXbhXHTJw7SYaVde_8pHWNV6riqOneQpw@mail.gmail.com>
 <CAP2Ytb=x1FegAGrRqJCM5+OauxxgiGpKnY7xT8PoKyPwMwLTjA@mail.gmail.com>
 <CAP2Ytbm9=KOG5bL9g_md9QhDb_2gDD3t3bVtXdhW-zoPnKvfQg@mail.gmail.com>
 <CAP2Ytbnr+tnRnP0Z3KqwRWsu=tpT3OWLPPiW_383u_RqCOC4dg@mail.gmail.com>
 <CAP2Ytbkhpy99Q4Nb-0fwR7WN3k84UcMTZHoWa7JT86k6oLYqXA@mail.gmail.com>
 <CAP2Ytb=gpo3DvabcF3h_fmM+8qn5NcQ2cBt6PbwnRCM50NRyvg@mail.gmail.com>
 <CAP2YtbkXBBQNfZE_nAMand+Ko1HmefmMaxJAqebtrhNMR-SDow@mail.gmail.com>
 <CAP2YtbkiGgFAi2c8C0g7GNLNmaGhPVspwOs5XQP9HB2Py2kGPw@mail.gmail.com>
 <CAP2Ytbnkz38GeMdW700=fvijm58s8L8bS8U8SSUq8GWf7_vZ=Q@mail.gmail.com>
 <CAP2Ytbn_bmX+YJXyQPw+AHyEso2-AF08--3JWumxfnTZ=yB0fA@mail.gmail.com>
 <CAP2YtbktUtdHa8R6ch9LNx-+76osO9QX=1T8jj6Nym2wOLyOpw@mail.gmail.com>
 <CAP2YtbmuFqWYHaeY8PtDr=B13Em6Ko3EuZtsd3UdjOw=XS_J=Q@mail.gmail.com>
 <CAP2Ytb=zmXvw-QK8sBd0TQaLLbJ6ih3V4Hag1d++O4jKAr1FAw@mail.gmail.com>
 <CAP2Ytbkd=8f8KTOYzsF0562KSwsXZJhFWnQPSCNJkR5OGL6QDg@mail.gmail.com>
 <CAP2Ytb=ia1+wTBnGL9VO+szodcQF2OdgcbmszT19jt+P-wkoTA@mail.gmail.com> <CAP2Ytb=kECmNhwhwPxqWQi+6vaOHCe2ZqYFjRSsdpFP1Nq+tbA@mail.gmail.com>
From:   Alexander Holmes <chineduomor6@gmail.com>
Date:   Sat, 17 Apr 2021 16:27:37 +0000
Message-ID: <CAP2YtbkyPJqGcQR7j=pLdu0aOe3jFXC6Cn4MmVVcQqvHMUXrog@mail.gmail.com>
Subject: GOOD
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

How are you today?

This is MoneyGram International Inc. we are contacting you concerning
your winning fund $1.500, 000.00 USD; your e-mail won $1.500, 000.00
dollars through Internet contest, and lottery bonus under MoneyGram
International Inc. Worldwide. The lottery bonus is contesting once in
a year, and we are doing it to promote this company MoneyGram
International Inc. The last contest was made through the internet by
people=E2=80=99s email worldwide, for example. USA, CANADA, RUSSIA, EUROPE,
ASIA, AFRICA, UNITED KINGDOM, GERMANY, TOGO, SOUTH AFRICA, UAE,
ETC...........................

We are contacting you because you are among the winning people and
your winning code is [XHMG02639]. We have programmed your daily
transfer payment at the minimum of =E2=82=AC4,500 Euros daily. Therefore yo=
u
are advised to contact branch office Togo, with your complete info,
such as below.

Your surname......................
Your middle name..................
Your name........................
Your home address...............
Your country........................
Your phone number.................
Your occupation/ your work...................
Your passport or Identity Card copy.......................

Kindly contact the MoneyGram Agent Mr. DENIS KODJO, Phone: +228
79541985, via this email ( moneygramdepromo@gmail.com ) to release
your first payment pick up information.

Regards
CEO: W. Alexander Holmes
