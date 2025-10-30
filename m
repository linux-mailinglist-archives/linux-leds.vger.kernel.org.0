Return-Path: <linux-leds+bounces-5942-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2FC1F6A7
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 11:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2A4404350
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 10:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0183634DCDB;
	Thu, 30 Oct 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JYwBJsiK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB020C00C;
	Thu, 30 Oct 2025 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818426; cv=none; b=ZOnzPmUZ2MSplnm95sujBpcMTKZ99RkWBsaDuHqi/IZKpwKsqxBYFIcbHSlB+yuQdtU6KV6YeQ8mLuUuN8y6CgK6RF2LgndST/AXgBzcN7TSkdsg2iarf6Iif0Rtitjf53YpwKaU8khiHSIYgmr0OCMnjWEhCPDA/osb2atpRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818426; c=relaxed/simple;
	bh=I3+YqfFCRtl6j5QQ2lS/wwJnhuK7USneDwjmQMLgdKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCisSr9sBCMYBONTbSirakZW2f2MzXEV/U60QV3BoJzvtoI8ZL9wb3CDIDPvY5E2lPwH7o3Ohh7nF3ihEuPX6/WWwCsUgMMllb5ZOBQ0h4ud9LRIZpffUkXVAOI5xG/T507GVwDIQwpybfBHqCODoCzK0z9PI6pmE7vpKCtCRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JYwBJsiK; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761818410; x=1762423210; i=markus.elfring@web.de;
	bh=d87Oc3FDcPh4LUBpg6aBD73kJHnlP2/LnnQ8MPCUgDs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JYwBJsiKtj1JUwTS8NRaosAGE06kPALxJcmYV1Ihrj258c3zo5RExb0Ot1CXK3LB
	 4sFOme81BHjwpRimFxamhClbdZncNftTzottFkziqrndFGlk9SINlLI0dcVKimNk/
	 fpZ38YCxiaBTYh0CEdOzBlkEyR3ydvX/t99+VXncJRNvC0jNTO0UfQujku2jVS6aM
	 cBFqWoJE9wxR3Eg0XcXZ2w2huUOnHd+zZ1QXLqRE+8gwcqxfqCpvkDo+pyLxS+dHJ
	 JlxQ1YKAPxLTyCC4rIl70pLmbrm7H2VUCVY+yWZFvwDhzcxI4spQSDJIZLg8IEQFq
	 4VUQqqvqGCKkrh9s+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgzeZ-1vv9j50KDd-00ospI; Thu, 30
 Oct 2025 11:00:10 +0100
Message-ID: <30218df3-55a1-4369-8591-7726b166e88f@web.de>
Date: Thu, 30 Oct 2025 11:00:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: netxbig: fix GPIO descriptor leak in error paths
To: vulab@iscas.ac.cn, linux-leds@vger.kernel.org, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251028082117.276-1-vulab@iscas.ac.cn>
 <20251030025312.1623-1-vulab@iscas.ac.cn>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251030025312.1623-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G64wqfABEdkPfEp3xSU82XjUyTiOLlNcZW9Yr6XS/nCuDCaLxKx
 g005TOFcpvL9p1HLvQbvZHTxt3c/QUh1rYvWKBc5QvDVFPbY5MPj3n4/lymKokGPFOmumPx
 ofUapoE7JBl5kbC3kuQiEOgMcS6LTp5K1RIQKK8Akaa7eJlqiho8jYtLCh9oyhKzRSBulPU
 xvrCCltgkItuMYi+7fFxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aJBWf5ehvlc=;49byu2dHsf9DQiHzEKdk1pqmMaC
 N1w+XvEry+aWjdVyOmgBgNFrfdbcl+D//wp8KJZrqL7bXQW1YXkz2rYuqYp1jx3v6JASNHrCi
 p8Pn63LbfZu5r7St01EzkBDG9H7hrXgae/SMk2jpdo+FLdSRRwaAT8HkYlz6TUJaCKPrHCefb
 P3vwnQor/SqgOADrEYw4LHs9z80Rpb/Mqi80uNUwjiLjsFufM4KLI3dM3bTuSNOnRzcH1qnFc
 zswnHMtFlt+W4+iXDxjHp7Lf5FCQ6KUroewGxMGP/R0hBsh4Rxi6aR4J1W7JBL9WDyS7zzhOD
 t1VH8gSGpE2WbIsaSHMmFTpQvxg73n6z6EpYkXH/vkMLRtjQE/REz1hVSflC3kyGx/YNJGi3+
 nbEQXqfODE+0rg1zsE748d0ssbMb6sdDxiAClxk7rlgS/O8PszAxGMYwImcLRQWZtS2/ByCYy
 YAkGGse+bjj6NatNY1BkN0xtu/NHbZV9RtgMzmCE5otFyFWsBM5NlfGpn8BbWn4VI5YXajbJD
 N2mYHg4eGCtsEYgD/KWfy30FcyV7neRhMSCYmoRIRgirc/Hdlf/X6jIMLLLYOBM81FLYLbRCk
 YCr++NgvMVieOJ/p1EWiXWPm39nuZfhb55Bi1by93ejXB4M329xKCBoOz6EYsgziPtK0Ia7/H
 86Xb05IDp6oAF4sOPp8CmCYp8k5TokSb2FyuEz70R66sH/aPAYofyVH9msPufPLL9THlBtJkd
 py/ffOE25nVZf9fwbtZW6uN7/g1AslD31tHR6k5zGPMfKkN1by/nuWLuiZ5zfkH7mmCnOR0Hn
 onTG7rmX8aSgxLLLXzEPvFyagQfKgrWbD3zMbDXAo1bbLmG88HKCSjECmwEhhKV12WvIx0Iri
 bOjfVLVhefsxLpgpO83y53gpSrdWoe3lD4UWCRDBswfSaeBXZyfzLkPVGZiUbPFxXAlBCzsvO
 ybC1uCa+WnOjUE+BeYML7zfFcy8Xn3FE7f0NsggKkQU1lmxp5M//3egWSLI6S9IMOutt15RK2
 /eDH/IGLdUcgLLImQdtwgGp0z/8GeuLbG3/KYiHcz0VQgXaZ/rT619YPy1iDHEl12tYHnbvNF
 mqhIEQTq+tD2+YTd7d0fPURRi4myMaZDuBUTfbR3pybI6HiG3EEGnRw6op4avsjLb+snosooR
 oi3fpXosqJa1DrECsLLyYbtqyH9omMVWjgWyTl5Ig01eaN8yfuhJyE1C5b72Fceruy8R3y+0u
 Qxg9J/L1qofil/fx+nz+jV2HKzuSWUszyhge1axlDF6WS6qCt7Lzsmk27npr0CoGI1j+xiENn
 HftaDfxXsm6MnmrG99UwGtdJIYK4suta9j3Bw4QU6D19eLbvTNLLaz/9I9xiiVkC0x3cfPpfr
 nd1LCzhsCpFGs2L0RWJmA/vP+sE3n1aBKg1y1VKG2V9Y/tdIEzD4gnBouPcdkwIyuOmUonawb
 BAyq6LekChBPpt8MfQQyWMO9Im/54SR50EPRLVF1gyyGkUsAC1nI+eBrcMvn3u2bYJMV7Sncs
 5TYuRNNzfMORs2KdzOFIZeifMkl+1WnF8vU1JtgL/koqvUfWD3E0sDQm2D4IZPyX3B8BirXCp
 xdIuPIVZTXe8k8v3MexNNqTvRLySfR11s0v9PCoCyydjLGAFJYowoLd9/s2huqJ10E37HuOl9
 CV8W/E3OzohyJf57+taBgWJ8+pzY3Z8AapGOO+r5OZGVsrlK0ulCqCmwNGm6UzDQwAPbVktpp
 51aBLBIlo3O0/xi8Z6KMRrbk0SkYxPR7at74YB2ASJledqzQ37VamI1yVT9APNtbVEdzHMVjR
 rPbZfjHQ2d4DLnMJ88SQ/7XHCqIUt0rjrtOwY+BVSQmWsm1vCNHRDYz6z97VDQMDQPKET0+Qy
 4FU76z24wgAEjevJGXEUYLf+jdUQMvQp3P+dALh3DeUjiT84KBLZkz85vHmAphbI+cZXttp21
 aKxl3J+oSpyZSfVz1L39f6CW9miG7/37gmwRfdKJDCEqGOijmAo0+szEZWMXAARIb0YUtl8ET
 bG5xgZ8Ssh+iT0wOuQfhkKAaaT8WVzmUoJ0vuOK6GfpzH1thOVDJJdrmiZPlDR2ar4vD7HuTc
 zaSIO4Gwtoox1J4hO2mPBlQsjgXGEsV6ZZ9dEcBxdmF9qLvt7DWgnoie2EbX5Vr15NnsuCfD9
 tkEgsUswqlOoovRHWQrY0U7Tm5sHdA+oqVopa1CkSNXB8X2PdihaMFgcLhihtrHsKta2JuuOG
 ZxEI3S1y9ppk+1bzsQIBadRr7O7llflp0gd4TQ4whJ6PSuyK9vxgJVT2z6XF3sA6iAZ6aAlhw
 2IgBXl25rCfeM6uQ7/Ja7kvnHYGMRySUoyYrSOm8/yNoEZGBfD1X90M2PqEmZ7TF2d2dx6ru8
 LfoHpNJvnyXgisTFZ5BGXiE6RO/Taka6mrT9as6+DZgBmschR9gND8qHosUK1DYZXALf1kBpm
 FO8AI3OSl8PT2x3Eof+omm66ytmpeujYmab/nyITa4ZZ89VJsUcGOKkIJx2xkH2WljoIe+7kg
 ff3QG1Ilw9Olp3KG0e7ReZynTcowz/jpjosXMUZg6WWMiPcmPzmwbGQwbizIsGGKCh2iBetfH
 d9n/x4cmk//BY4Qok4wHI7b/kGG1zCcvO9GrTc8iGf0oMBTPJehnkbotA+E6wAu13zVL5Srql
 IVHOwh1a7lXfwwLFWlRaj1ScX4x2YChwnbQVX/Z//wP2rR5u+dngOvsGikIlblvdAy+vZebN4
 SIkvAHYnze81YhgBMXXHUSox8lN/6DomIBlL+SsX2uPXyWwOr5iqiF+zP30dWdCV0LpybStdH
 2Agh+QGak5gWq2ZCQONcxVls4VJCfldWO3FXYS7nMHn1GZjUAvY5lmz73F5LTwefd8lPcmTHv
 twSRCyF/9w6LAloPEXak2W298hwejH24mooimpgLR23BrM2qpBSfEEurca7wOPhQOZ1Bd2BuL
 8jYtUJX6aMaB17jiwv7BAx0zANgMv+XkL/SsAFkkXSP5799Ss99X0eWktzDzfWtVLxDGFnB/a
 JdZOyOBxDlJGNOI5gONiHkrwL86dMkvRqF7eciQ+9LcA3PElOJJIymBg2+0HJkFv2shlKCCop
 3T5FqZhjMNFNFdis1xxsOQzjtJTUdc0PLm54rObInQBpxXBKoeJEnY/ybBSot/b4HoMJaTG5K
 e+YXf3cBmBk8IO/FRj0U4LWCJOQee4GRuCma7R8V/rEdRihWJogZcb1u4FA5kKDcXf0sllpvF
 kRSi5Q4VI+q29NDTgQYCeGLN/3iVZVbmQpn5SmX/rpU1r5Zi6V9m3C/dYr9uW7QqWh3NGSKPd
 GfBzgKJLZKDDHiZHUlz63JO6u5nmt2iZp5oZFXInjwxgpZDFY9tb89Tcia8aL6OkKk+rqmog5
 YbglvEmUckkd0UvO4tDVivNhrpgFmX5GL1XLU75bdgDx4IXRxoPGmPeNmL6z+7rp5vglNh10c
 8YYEQ0fP+DwQdE69OpFwJNFeWo37jeHmj9p93bV6OA/VZozrvQknVZ7bQTe0sinuDG1hnQlxi
 m7occF/w81cX7B8CulKH0jFGMuHSSYwBdB7WYgBudLc8bliblIsSFlqEXG97qk7/Pyw/ZP4OD
 kV5Xp8EqpiGcNjoAVizoLrzTAfghQLZc+EluLg6492/ekVgIW4jv8EJqVcaey/QT8H2G2IBfM
 oeAKcM4nidqTrwNjATCdwDvuP17PDXVX1jqpRczYZ7p9SbIAH74hjucDwJW4wQABCBVUA8Qzs
 0H6RNyspKxsCELOXC2znDiDNMH82rO/3WSaY2wQffOHQLX22RQsz92no3ivXogqVSK+I78j+B
 GCHUz4DxmXsGIaKARWdhL1An6tW4fRGZb4/M8+xI5xM/2QcqfXs2AAYDXOqzqaitCagShZiWP
 q9JuvN//GYzAlUJx6lJuiwseGNPzBNoQEINaTijeeKJcKMr9sO04qBUMTKf/MghHJGHxj7elT
 XqRqnoEsCLrizW9wZ9pdwcie8Q1FdAxVRkSwp44TWMQOQ6jUeVeTh+8dtD0VfZ64QhRW+xIAY
 OPV/2seBc90nyDIuQNKf71LXdS/c7YxNzvRFy9wJuA82qJ1JErjOKAauj5eeWjceZjwAVhGLE
 80QXxjmaJJDijDZTof0qYt9mu9wdmykCtllYPfkVWeWxCUZrlIKks8NOSwLTDw7C8270MzkIB
 yufNIIBCwl/5zHqpRBYW5XPm2Qw5O5bSWvtNRGkTtlqqP/uy8sExgc4IEDabHGr3rPKEeo1y+
 kix4zUBLuEb/QQzfzWqrCR2ab4rE2FA/3xzubWWDsS2GjQLAeDhs5s4HLxzWBrP7sxTV+DtnV
 cz9qoML7rtoDkeKarTGDddPxl3eBf7n2pvN+qLQihRT0T49fgJwXOhEeWOZfj5aSY/DE4q0Mq
 OMa3xzqK+lAro3CArfWF1BmNtkX67WPWFb20SC1RbkAfLhJ7Jdda2DoPvaZC1WRxDFSxnLk6u
 0D6kY6+mScECHo3//S8VfwFqOnsq/OHsjBSa+Fym2gi69oOQgyDzLTLZLW7NPDhGmqxzBJ98B
 g5y10URW840EPng/h6CKmDFwHsghXh4EaVRP68VTw4aslm30ajSX98WFUJEEezCp2EIAkByvq
 9p2uBAlb3VqgZdVZyO6O7BH1PNpS3hHyJxXKBYKWKvBsGhFACGJEnvSMFu2CxoxoWo99Fkw4x
 +5HYA9A1hghcfs+U3UntiPsr2XwqHhp3EcKswy3NOUPYrCw2+blZCGMCBKAeoDAyySPxfyC+6
 R2H+DL2X8wsSGpNOTGPhv760Gaag9bUgq4FHTOC9T7H0DkUanekd9rpUZqFGIBZzKJsx0pBjw
 dg1D7GjAW1xsU2Yoan96HzwAa2NKlyGzsXxdC9KhpMoHKb6/3Azu9AAYFzDlewx8JRxes92VG
 PIzGl6GG/YSilnkBKm9w+FFsaXbovGM5f0ezHdbi2KeQcNWW5bl1cCh74fCds6m2aPP4JPI0R
 pr7UYXnRwypqkUATGObnvc7N2kAE8+rUXl3fxdWw3Z+0cBZocTry50EsrPlKux6Ac30xDJApS
 5n4WMKGjSWatB5+UcNG3qYf+1A0YpYlKSqn6GagupDxvcFdt+4LuIDqiQ+lEuzWQRdQCg==

=E2=80=A6> ---
> Changes in v2:
> - Consolidate PTR_ERR(gpiod) extraction into err_gpiod_put label
=E2=80=A6

Thanks.

I see another refinement possibility.


=E2=80=A6> +++ b/drivers/leds/leds-netxbig.c
=E2=80=A6> @@ -374,46 +377,61 @@ static int netxbig_gpio_ext_get(struct de=
vice *dev,
>  	for (i =3D 0; i < num_addr; i++) {
>  		gpiod =3D gpiod_get_index(gpio_ext_dev, "addr", i,
>  					GPIOD_OUT_LOW);
> -		if (IS_ERR(gpiod))
> -			return PTR_ERR(gpiod);
> +		if (IS_ERR(gpiod)) {
> +			ret =3D PTR_ERR(gpiod);

Why do propose to add this statement here?


> +			goto err_free_addr;
> +		}
=E2=80=A6> +err_gpiod_put:
> +	ret =3D PTR_ERR(gpiod);
> +err_free_data:
> +	for (i =3D 0; i < gpio_ext->num_data; i++)
> +		gpiod_put(gpio_ext->data[i]);


Would you find the following source code usable between the other two labe=
ls?

err_set_code:
	ret =3D PTR_ERR(gpiod);


> +err_free_addr:
> +	for (i =3D 0; i < gpio_ext->num_addr; i++)
> +		gpiod_put(gpio_ext->addr[i]);
> +	return ret;
>  }
=E2=80=A6

Regards,
Markus

